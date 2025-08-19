package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.PartyDto;
import com.radiuk.unmatched_backend_core.dto.TeamDto;
import com.radiuk.unmatched_backend_core.dto.UserPartyDto;
import com.radiuk.unmatched_backend_core.model.*;
import com.radiuk.unmatched_backend_core.repository.*;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.OffsetDateTime;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
@RequiredArgsConstructor
public class PartyService {

    private final PartyCacheService partyCacheService;
    private final DeckCacheService deckCacheService;
    private final BoardRepository boardRepository;
    private final MatchRepository matchRepository;
    private final TeamRepository teamRepository;
    private final PartyRepository partyRepository;
    private final UserRepository userRepository;
    private final DeckRepository deckRepository;

    public PartyDto getPartyByMatchId(Long matchId) {
        log.debug("[PartyService] -> getPartyByMatchId called with matchId={}", matchId);
        return partyCacheService.getFromCache(matchId);
    }

    public List<PartyDto> getAllPartiesByUsername(String username) {
        log.debug("[PartyService] -> getAllPartiesByUsername called with username={}", username);
        return partyCacheService.getAllFromCache(username);
    }

    @Transactional
    public PartyDto createParty(PartyDto partyDto) {
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
        match.setPlayedAt(date);
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

            partyRepository.save(Party.builder().match(match).team(team).user(user).deck(deck).board(board).moveOrder(userPartyDto.getMoveOrder()).finalHp(userPartyDto.getFinalHp()).isWinner(isUserWin(userPartyDto, partyDto)).createdAt(date).build());
        }

        deckCacheService.evictTopFromCache();

        PartyDto createdParty = getPartyByMatchId(match.getId());
        log.info("[PartyService] -> createParty finished successfully for matchId={}", match.getId());
        return createdParty;
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
