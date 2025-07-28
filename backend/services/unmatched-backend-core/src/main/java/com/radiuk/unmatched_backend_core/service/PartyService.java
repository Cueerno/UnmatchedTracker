package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.PartyDto;
import com.radiuk.unmatched_backend_core.dto.TeamDto;
import com.radiuk.unmatched_backend_core.dto.UserPartyDto;
import com.radiuk.unmatched_backend_core.model.Match;
import com.radiuk.unmatched_backend_core.model.Party;
import com.radiuk.unmatched_backend_core.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Comparator;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class PartyService {

    private final PartyRepository partyRepository;
    private final MatchRepository matchRepository;

    @Transactional(readOnly = true)
    public PartyDto getPartyByMatchId(Long matchId) {
        Match match = matchRepository.findById(matchId).orElse(null); // todo exception

        List<Party> parties = partyRepository.findByMatchId(matchId);

        List<UserPartyDto> users = parties.stream()
                .map(party -> UserPartyDto.builder()
                        .username(party.getUser().getUsername())
                        .character(party.getCharacter().getName())
                        .moveOrder(Optional.ofNullable(party.getMoveOrder()).orElse((short) 0))
                        .finalHp(Optional.ofNullable(party.getFinalHp()).orElse((short) 0))
                        .build())
                .sorted(Comparator.comparingInt(UserPartyDto::getMoveOrder))
                .toList();

        List<TeamDto> teams = match.getTeams().stream()
                .map(team -> TeamDto.builder()
                        .name(Optional.ofNullable(team.getName()).orElse("No name"))
                        .build())
                .toList();

        String boardName = parties.stream()
                .map(p -> p.getBoard().getName())
                .findFirst()
                .orElse("-");

        String winningTeam = parties.stream()
                .filter(Party::getIsWinner)
                .map(p -> p.getTeam().getName())
                .findFirst()
                .orElse("-");

        return PartyDto.builder()
                .users(users)
                .teams(teams)
                .date(match.getPlayedAt())
                .boardName(boardName)
                .winner(winningTeam)
                .build();
    }

}
