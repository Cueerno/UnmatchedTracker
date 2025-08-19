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
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@Slf4j
@Service
@RequiredArgsConstructor
public class PartyCacheService {

    private final PartyRepository partyRepository;
    private final MatchRepository matchRepository;
    private final UserRepository userRepository;

    @Cacheable(value = "userPartyList", key = "#username")
    @Transactional(readOnly = true)
    public List<PartyDto> getAllFromCache(String username) {
        log.debug("[PartyCacheService] -> getAllFromCache called with username={}", username);

        User user = userRepository.findByUsername(username).orElseThrow(() -> {
            log.warn("[PartyCacheService] -> getAllFromCache: User not found with username={}", username);
            return new EntityNotFoundException("User with name " + username + " not found!");
        });

        Set<Long> partyIds = partyRepository.getPartiesByUserId(user.getId());
        List<PartyDto> parties = partyIds.stream().map(this::getFromCache).toList();

        log.info("[PartyCacheService] -> getAllFromCache finished successfully: {} parties retrieved for username={}", parties.size(), username);
        return parties;
    }

    @Cacheable(value = "party", key = "#matchId")
    @Transactional(readOnly = true)
    public PartyDto getFromCache(Long matchId) {
        log.debug("[PartyCacheService] -> getFromCache party with matchId={}", matchId);

        Match match = matchRepository.findById(matchId).orElseThrow(() -> {
            log.warn("[PartyCacheService] -> getFromCache: Party not found with matchId={}", matchId);
            return new EntityNotFoundException("Party with id " + matchId + " not found!");
        });

        List<Party> parties = partyRepository.findByMatchId(matchId);
        log.info("[PartyCacheService] -> Retrieved {} party entries for matchId={}", parties.size(), matchId);

        List<UserPartyDto> users = parties.stream()
                .map(party -> UserPartyDto.builder()
                        .username(party.getUser().getUsername())
                        .deck(party.getDeck().getName())
                        .moveOrder(Optional.ofNullable(party.getMoveOrder()).orElse((short) 0))
                        .finalHp(Optional.ofNullable(party.getFinalHp()).orElse((short) 0))
                        .build())
                .sorted(Comparator.comparingInt(UserPartyDto::getMoveOrder))
                .toList();

        log.info("[PartyCacheService] -> Found {} parties for matchId={}", users.size(), matchId);

        Match.MatchFormat format = match.getFormat();

        log.info("[PartyCacheService] -> Found format for matchId={}", format);

        List<TeamDto> teams = match.getTeams().stream()
                .map(team -> TeamDto.builder()
                        .name(Optional.ofNullable(team.getName()).orElse("No name"))
                        .build())
                .toList();

        log.info("[PartyCacheService] -> Found {} teams for matchId={}", teams.size(), matchId);

        String boardName = parties.stream()
                .map(p -> p.getBoard().getName())
                .findFirst()
                .orElse("-");

        log.info("[PartyCacheService] -> Found {} board for matchId={}", boardName, matchId);

        String winningTeam = parties.stream()
                .filter(Party::getIsWinner)
                .map(p -> p.getTeam().getName())
                .findFirst()
                .orElse("-");

        log.info("[PartyCacheService] -> Found {} winning team for matchId={}", winningTeam, matchId);

        PartyDto partyDto = PartyDto.builder()
                .matchId(matchId)
                .users(users)
                .format(format)
                .teams(teams)
                .date(match.getPlayedAt())
                .boardName(boardName)
                .winner(winningTeam)
                .build();

        log.info("[PartyCacheService] -> Retrieved {} party for matchId={}", partyDto, matchId);

        return partyDto;
    }
}
