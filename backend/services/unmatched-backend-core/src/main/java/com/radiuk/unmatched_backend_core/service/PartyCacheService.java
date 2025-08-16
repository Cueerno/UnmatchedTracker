package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.PartyDto;
import com.radiuk.unmatched_backend_core.dto.TeamDto;
import com.radiuk.unmatched_backend_core.dto.UserPartyDto;
import com.radiuk.unmatched_backend_core.model.Match;
import com.radiuk.unmatched_backend_core.model.Party;
import com.radiuk.unmatched_backend_core.model.User;
import com.radiuk.unmatched_backend_core.repository.MatchRepository;
import com.radiuk.unmatched_backend_core.repository.PartyRepository;
import com.radiuk.unmatched_backend_core.repository.UserRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;


@Service
@RequiredArgsConstructor
public class PartyCacheService {

    private final PartyRepository partyRepository;
    private final MatchRepository matchRepository;
    private final UserRepository userRepository;

    @Cacheable(value = "userPartyList", key = "#username")
    @Transactional(readOnly = true)
    public List<PartyDto> getAllFromCache(String username) {
        User user = userRepository.findByUsername(username).orElseThrow(() -> new EntityNotFoundException("User with name " + username + " not found!"));
        Set<Long> numberOfParties = partyRepository.getPartiesByUserId(user.getId());

        List<PartyDto> parties = new ArrayList<>();

        for (long numberOfParty = 0L; numberOfParty < numberOfParties.size(); numberOfParty++) {
            parties.add(getFromCache(numberOfParties.stream().skip(numberOfParty).findFirst().orElse(null)));
        }

        return parties;
    }

    @Cacheable(value = "party", key = "#matchId")
    @Transactional(readOnly = true)
    public PartyDto getFromCache(Long matchId) {
        Match match = matchRepository.findById(matchId).orElseThrow(() -> new EntityNotFoundException("Party with id " + matchId + " not found!"));

        List<Party> parties = partyRepository.findByMatchId(matchId);

        List<UserPartyDto> users = parties.stream()
                .map(party -> UserPartyDto.builder()
                        .username(party.getUser().getUsername())
                        .deck(party.getDeck().getName())
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
                .matchId(matchId)
                .users(users)
                .format(format)
                .teams(teams)
                .date(match.getPlayedAt())
                .boardName(boardName)
                .winner(winningTeam)
                .build();
    }
}
