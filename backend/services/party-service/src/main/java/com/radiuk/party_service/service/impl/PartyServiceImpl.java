package com.radiuk.party_service.service.impl;

import com.radiuk.party_service.dto.PartyDto;
import com.radiuk.party_service.dto.TeamDto;
import com.radiuk.party_service.dto.UserPartyDto;
import com.radiuk.party_service.dto.proxy.BoardDto;
import com.radiuk.party_service.dto.proxy.DeckDto;
import com.radiuk.party_service.dto.proxy.ResponseDto;
import com.radiuk.party_service.exception.PartyNotFoundException;
import com.radiuk.party_service.model.Match;
import com.radiuk.party_service.model.Party;
import com.radiuk.party_service.model.PartyEvent;
import com.radiuk.party_service.model.Team;
import com.radiuk.party_service.proxy.BoardProxy;
import com.radiuk.party_service.proxy.DeckProxy;
import com.radiuk.party_service.proxy.UserProxy;
import com.radiuk.party_service.repository.MatchRepository;
import com.radiuk.party_service.repository.PartyRepository;
import com.radiuk.party_service.repository.TeamRepository;
import com.radiuk.party_service.service.PartyService;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;
import java.util.*;

@Service
@RequiredArgsConstructor
public class PartyServiceImpl implements PartyService {

    private final BoardProxy boardProxy;
    private final MatchRepository matchRepository;
    private final TeamRepository teamRepository;
    private final PartyRepository partyRepository;
    private final DeckProxy deckProxy;
    private final ApplicationEventPublisher applicationEventPublisher;
    private final UserProxy userProxy;

    @Override
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

    @Override
    @Cacheable(value = "userPartyList", key = "#username")
    @Transactional(readOnly = true)
    public List<PartyDto> getPartiesByUserUsername(String username) {

        ResponseDto user = userProxy.getUserByUsername(username);

        Set<Long> partyIds = partyRepository.getPartiesByUserId(user.id());
        return partyIds.stream().map(this::getPartyByMatchId).toList();
    }

    @Override
    @Transactional
    public void create(PartyDto partyDto) {

        Instant date = partyDto.getDate() != null ? partyDto.getDate() : Instant.now();

        BoardDto board = boardProxy.getBoardByName(partyDto.getBoardName());

        Match match = new Match();
        match.setFormat(partyDto.getFormat());
        match.setCreated_at(date);
        matchRepository.save(match);

        createTeamsAndParties(partyDto, match, date, board);
    }

    @Override
    @CacheEvict(value = "party", key = "#matchId")
    @Transactional
    public void update(Long matchId, PartyDto updatedPartyDto) {
        Match match = matchRepository.findById(matchId)
                .orElseThrow(() -> new PartyNotFoundException("Party with id " + matchId + " not found!"));

        match.setFormat(updatedPartyDto.getFormat());
        match.setCreated_at(
                updatedPartyDto.getDate() != null
                        ? updatedPartyDto.getDate()
                        : match.getCreated_at()
        );
        matchRepository.save(match);

        List<Team> existingTeams = teamRepository.findByMatchId(matchId);
        for (Team team : existingTeams) {
            partyRepository.deleteAll(partyRepository.findByMatchId(team.getId()));
        }
        teamRepository.deleteAll(existingTeams);

        Instant date = updatedPartyDto.getDate() != null ? updatedPartyDto.getDate() : Instant.now();

        BoardDto board = boardProxy.getBoardByName(updatedPartyDto.getBoardName());

        createTeamsAndParties(updatedPartyDto, match, date, board);
    }

    private void createTeamsAndParties(PartyDto updatedPartyDto, Match match, Instant date, BoardDto board) {
        Map<String, Team> teamMap = new HashMap<>();
        for (TeamDto teamDto : updatedPartyDto.getTeams()) {
            Team team = new Team();
            team.setName(teamDto.getName());
            team.setMatch(match);
            team.setCreatedAt(date);
            teamRepository.save(team);
            match.getTeams().add(team);
            teamMap.put(teamDto.getName(), team);
        }

        for (UserPartyDto userPartyDto : updatedPartyDto.getUsers()) {
            ResponseDto user = userProxy.getUserByUsername(userPartyDto.getUsername());
            DeckDto deck = deckProxy.getDeckByName(userPartyDto.getDeck());
            Team team = teamMap.get(getUserTeamName(userPartyDto, updatedPartyDto));

            Party savedParty = partyRepository.save(Party.builder()
                    .match(match)
                    .team(team)
                    .userId(user.id())
                    .deckId(deck.id())
                    .boardId(board.id())
                    .moveOrder(userPartyDto.getMoveOrder())
                    .finalHp(userPartyDto.getFinalHp())
                    .isWinner(isUserWin(userPartyDto, updatedPartyDto))
                    .createdAt(date)
                    .build());

            applicationEventPublisher.publishEvent(new PartyEvent(savedParty));
        }
    }

    @Override
    @Transactional
    public void delete(Long matchId) {
        if (!matchRepository.existsById(matchId)) {
            throw new EntityNotFoundException("Match with id " + matchId + " not found");
        }
        matchRepository.deleteById(matchId);
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

