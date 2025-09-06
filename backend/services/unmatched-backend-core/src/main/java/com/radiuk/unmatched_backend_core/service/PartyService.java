package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.PartyDto;
import com.radiuk.unmatched_backend_core.dto.TeamDto;
import com.radiuk.unmatched_backend_core.dto.UserPartyDto;
import com.radiuk.unmatched_backend_core.model.*;
import com.radiuk.unmatched_backend_core.repository.*;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.OffsetDateTime;
import java.util.*;
import java.util.Set;

@Slf4j
@Service
@RequiredArgsConstructor
public class PartyService {

    private final DeckService deckService;
    private final BoardRepository boardRepository;
    private final MatchRepository matchRepository;
    private final TeamRepository teamRepository;
    private final PartyRepository partyRepository;
    private final UserRepository userRepository;
    private final DeckRepository deckRepository;
    private final CvsBackupService cvsBackupService;

    @Cacheable(value = "party", key = "#matchId")
    @Transactional(readOnly = true)
    public PartyDto getPartyByMatchId(Long matchId) {
        log.debug("[PartyService] -> get getPartyByMatchId with matchId={}", matchId);

        Match match = matchRepository.findById(matchId).orElseThrow(() -> {
            log.warn("[PartService] -> getPartyByMatchId: Party not found with matchId={}", matchId);
            return new EntityNotFoundException("Party with id " + matchId + " not found!");
        });

        List<Party> parties = partyRepository.findByMatchId(matchId);
        log.info("[PartyService] -> Retrieved {} party entries for matchId={}", parties.size(), matchId);

        List<UserPartyDto> users = parties.stream()
                .map(party -> UserPartyDto.builder()
                        .username(party.getUser().getUsername())
                        .deck(party.getDeck().getName())
                        .moveOrder(Optional.ofNullable(party.getMoveOrder()).orElse((short) 0))
                        .finalHp(Optional.ofNullable(party.getFinalHp()).orElse((short) 0))
                        .build())
                .sorted(Comparator.comparingInt(UserPartyDto::getMoveOrder))
                .toList();

        log.info("[PartyService] -> Found {} parties for matchId={}", users.size(), matchId);

        Match.MatchFormat format = match.getFormat();

        log.info("[PartyService] -> Found format={} for matchId={}", format, matchId);

        List<TeamDto> teams = match.getTeams().stream()
                .map(team -> TeamDto.builder()
                        .name(Optional.ofNullable(team.getName()).orElse("No name"))
                        .build())
                .toList();

        log.info("[PartyService] -> Found {} teams for matchId={}", teams.size(), matchId);

        String boardName = parties.stream()
                .map(p -> p.getBoard().getName())
                .findFirst()
                .orElse("-");

        log.info("[PartyService] -> Found {} board for matchId={}", boardName, matchId);

        String winningTeam = parties.stream()
                .filter(Party::getIsWinner)
                .map(p -> p.getTeam().getName())
                .findFirst()
                .orElse("-");

        log.info("[PartyService] -> Found {} winning team for matchId={}", winningTeam, matchId);

        PartyDto partyDto = PartyDto.builder()
                .matchId(matchId)
                .users(users)
                .format(format)
                .teams(teams)
                .date(parties.getFirst().getCreatedAt())
                .boardName(boardName)
                .winner(winningTeam)
                .build();

        log.info("[PartyService] -> Retrieved {} party for matchId={}", partyDto, matchId);

        return partyDto;
    }

    @Cacheable(value = "userPartyList", key = "#username")
    @Transactional(readOnly = true)
    public List<PartyDto> getAllPartiesByUsername(String username) {
        log.debug("[PartyService] -> getPartiesByUsername called with username={}", username);

        User user = userRepository.findByUsername(username).orElseThrow(() -> {
            log.warn("[PartyService] -> getPartiesByUsername: User not found with username={}", username);
            return new EntityNotFoundException("User with name " + username + " not found!");
        });

        Set<Long> partyIds = partyRepository.getPartiesByUserId(user.getId());
        List<PartyDto> parties = partyIds.stream().map(this::getPartyByMatchId).toList();

        log.info("[PartyService] -> getPartiesByUsername finished successfully: {} parties retrieved for username={}", parties.size(), username);
        return parties;
    }

    @Transactional
    public void createParty(PartyDto partyDto) {
        log.debug("[PartyService] -> createParty called with partyDto={}", partyDto);

        OffsetDateTime date;
        if (partyDto.getDate() == null) {
            date = OffsetDateTime.now();
        } else {
            date = partyDto.getDate();
        }

        Board board = boardRepository.findByName(partyDto.getBoardName()).orElseThrow(() -> {
            log.warn("[PartyService] -> createParty: Board not found with name={}", partyDto.getBoardName());
            return new EntityNotFoundException("Board with name " + partyDto.getBoardName() + " not found!");
        });


        Match match = new Match();
        match.setFormat(partyDto.getFormat());
        match.setCreated_at(date);
        matchRepository.save(match);

        Map<String, Team> teamMap = new HashMap<>();
        for (TeamDto teamDto : partyDto.getTeams()) {
            Team team = new Team();
            team.setName(teamDto.getName());
            team.setMatch(match);
            team.setCreatedAt(date);
            teamRepository.save(team);
            match.getTeams().add(team);
            teamMap.put(teamDto.getName(), team);
        }

        for (UserPartyDto userPartyDto : partyDto.getUsers()) {
            User user = userRepository.findByUsername(userPartyDto.getUsername()).orElseThrow(() -> {
                log.warn("[PartyService] -> createParty: User not found with username={}", userPartyDto.getUsername());
                return new EntityNotFoundException("User with name " + userPartyDto.getUsername() + " not found!");
            });

            Deck deck = deckRepository.findByName(userPartyDto.getDeck()).orElseThrow(() -> {
                log.warn("[PartyService] -> createParty: Deck not found with name={}", userPartyDto.getDeck());
                return new EntityNotFoundException("Deck with name " + userPartyDto.getDeck() + " not found!");
            });

            Team team = teamMap.get(getUserTeamName(userPartyDto, partyDto));

            Party savedParty = partyRepository.save(Party.builder()
                    .match(match)
                    .team(team)
                    .user(user)
                    .deck(deck)
                    .board(board)
                    .moveOrder(userPartyDto.getMoveOrder())
                    .finalHp(userPartyDto.getFinalHp())
                    .isWinner(isUserWin(userPartyDto, partyDto))
                    .createdAt(date)
                    .build());

            cvsBackupService.backupParty(savedParty);
        }

        deckService.evictTopFromCache();

        log.info("[PartyService] -> createParty finished successfully for matchId={}", match.getId());
    }

    private boolean isUserWin(UserPartyDto user, PartyDto dto) {
        List<String> winners = Arrays.asList(dto.getWinner().split("\\s*&\\s*"));
        return winners.contains(user.getUsername());
    }

    private String getUserTeamName(UserPartyDto userPartyDto, PartyDto partyDto) {
        Match.MatchFormat format = partyDto.getFormat();

        if (format != Match.MatchFormat.TEAMS) {
            return userPartyDto.getUsername();
        }

        for (TeamDto team : partyDto.getTeams()) {
            String username = userPartyDto.getUsername();
            String[] members = team.getName().split("\\s*&\\s*");
            for (String member : members) {
                if (member.equalsIgnoreCase(username)) {
                    return team.getName();
                }
            }
        }

        log.error("[PartyService] -> getUserTeamName: Team not found for user={}", userPartyDto.getUsername());
        throw new IllegalArgumentException("Team for user " + userPartyDto.getUsername() + " not found");
    }
}
