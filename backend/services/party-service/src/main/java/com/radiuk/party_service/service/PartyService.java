package com.radiuk.party_service.service;

import com.radiuk.party_service.dto.PartyDto;
import com.radiuk.party_service.dto.TeamDto;
import com.radiuk.party_service.dto.UserPartyDto;
import com.radiuk.party_service.dto.proxy.BoardDto;
import com.radiuk.party_service.dto.proxy.DeckDto;
import com.radiuk.party_service.dto.proxy.ResponseDto;
import com.radiuk.party_service.exception.PartyNotFoundException;
import com.radiuk.party_service.model.Match;
import com.radiuk.party_service.model.Party;
import com.radiuk.party_service.model.Team;
import com.radiuk.party_service.proxy.*;
import com.radiuk.party_service.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;
import java.util.*;

@Service
@RequiredArgsConstructor
public class PartyService {

    private final BoardProxy boardProxy;
    private final MatchRepository matchRepository;
    private final TeamRepository teamRepository;
    private final PartyRepository partyRepository;
    private final DeckProxy deckProxy;
    private final CvsBackupService cvsBackupService;
    private final UserProxy userProxy;

    @Cacheable(value = "party", key = "#matchId")
    @Transactional(readOnly = true)
    public PartyDto getPartyByMatchId(Long matchId) {

        Match match = matchRepository.findById(matchId)
                .orElseThrow(() -> new PartyNotFoundException("Party with id " + matchId + " not found!"));

        List<Party> parties = partyRepository.findByMatchId(matchId);

        List<UserPartyDto> users = parties.stream()
                .map(party -> UserPartyDto.builder()
                        .username(userProxy.getUserById(party.getUserId()).username())
                        .deck(deckProxy.getDeckById(party.getDeckId()).name())
                        .moveOrder(Optional.ofNullable(party.getMoveOrder()).orElse((short) 0))
                        .finalHp(Optional.ofNullable(party.getFinalHp()).orElse((short) 0))
                        .build())
                .sorted(Comparator.comparingInt(UserPartyDto::getMoveOrder))
                .toList();

        Match.MatchFormat format = match.getFormat();

        List<TeamDto> teams = match.getTeams().stream()
                .map(team -> TeamDto.builder()
                        .name(Optional.ofNullable(team.getName()).orElse("No name"))
                        .build())
                .toList();

        BoardDto board = boardProxy.getBoardById(parties.getFirst().getBoardId());

        String winningTeam = parties.stream()
                .filter(Party::getIsWinner)
                .map(p -> p.getTeam().getName())
                .findFirst()
                .orElse("-");

        return PartyDto.builder()
                .matchId(matchId)
                .users(users)
                .format(format)
                .teams(teams)
                .date(parties.getFirst().getCreatedAt())
                .boardName(board.name())
                .winner(winningTeam)
                .build();
    }

    @Cacheable(value = "userPartyList", key = "#username")
    @Transactional(readOnly = true)
    public List<PartyDto> getAllPartiesByUsername(String username) {

        ResponseDto user = userProxy.getUserByUsername(username);

        Set<Long> partyIds = partyRepository.getPartiesByUserId(user.id());
        return partyIds.stream().map(this::getPartyByMatchId).toList();
    }

    @Transactional
    public void createParty(PartyDto partyDto) {

        Instant date = partyDto.getDate() != null ? partyDto.getDate() : Instant.now();

        BoardDto board = boardProxy.getBoardByName(partyDto.getBoardName());

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
            ResponseDto user = userProxy.getUserByUsername(userPartyDto.getUsername());

            DeckDto deck = deckProxy.getDeckByName(userPartyDto.getDeck());

            Team team = teamMap.get(getUserTeamName(userPartyDto, partyDto));

            Party savedParty = partyRepository.save(Party.builder()
                    .match(match)
                    .team(team)
                    .userId(user.id())
                    .deckId(deck.id())
                    .boardId(board.id())
                    .moveOrder(userPartyDto.getMoveOrder())
                    .finalHp(userPartyDto.getFinalHp())
                    .isWinner(isUserWin(userPartyDto, partyDto))
                    .createdAt(date)
                    .build());

            cvsBackupService.backupParty(savedParty);
        }
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

        throw new IllegalArgumentException("Team for user " + userPartyDto.getUsername() + " not found");
    }
}
