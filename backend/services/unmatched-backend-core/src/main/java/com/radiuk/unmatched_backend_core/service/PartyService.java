package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.PartyDto;
import com.radiuk.unmatched_backend_core.dto.TeamDto;
import com.radiuk.unmatched_backend_core.dto.UserPartyDto;
import com.radiuk.unmatched_backend_core.model.*;
import com.radiuk.unmatched_backend_core.repository.*;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.OffsetDateTime;
import java.util.*;

@Service
@RequiredArgsConstructor
public class PartyService {

    private final PartyRepository partyRepository;
    private final MatchRepository matchRepository;
    private final UserRepository userRepository;
    private final TeamRepository teamRepository;
    private final DeckRepository deckRepository;
    private final BoardRepository boardRepository;
    private final DeckCacheService deckCacheService;
    private final PartyCacheService partyCacheService;

    public PartyDto getPartyByMatchId(Long matchId) {
        return partyCacheService.getFromCache(matchId);
    }

    @Transactional(readOnly = true)
    public List<PartyDto> getAllPartiesByUsername(String username) {
        return partyCacheService.getAllFromCache(username);
    }

    @Transactional
    public PartyDto createParty(PartyDto partyDto) {
        Board board = boardRepository.findByName(partyDto.getBoardName()).orElseThrow(() -> new EntityNotFoundException("Board with name " + partyDto.getBoardName() + " not found!"));
        OffsetDateTime date;

        if (partyDto.getDate() == null) {
            date = OffsetDateTime.now();
        } else {
            date = partyDto.getDate();
        }


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
            User user = userRepository.findByUsername(userPartyDto.getUsername()).orElseThrow(() -> new EntityNotFoundException("User with name " + userPartyDto.getUsername() + " not found!"));
            Deck deck = deckRepository.findByName(userPartyDto.getDeck()).orElseThrow(() -> new EntityNotFoundException("Deck with name " + userPartyDto.getDeck() + " not found!"));
            Team team = teamMap.get(getUserTeamName(userPartyDto, partyDto));

            partyRepository.save(
                    Party.builder()
                            .match(match)
                            .team(team)
                            .user(user)
                            .deck(deck)
                            .board(board)
                            .moveOrder(userPartyDto.getMoveOrder())
                            .finalHp(userPartyDto.getFinalHp())
                            .isWinner(isUserWin(userPartyDto, partyDto))
                            .createdAt(date)
                            .build()
            );
        }

        deckCacheService.evictTopFromCache();

        return getPartyByMatchId(match.getId());
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
