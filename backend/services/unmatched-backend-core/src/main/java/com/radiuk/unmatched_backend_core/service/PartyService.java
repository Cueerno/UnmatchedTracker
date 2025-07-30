package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.PartyDto;
import com.radiuk.unmatched_backend_core.dto.TeamDto;
import com.radiuk.unmatched_backend_core.dto.UserPartyDto;
import com.radiuk.unmatched_backend_core.model.*;
import com.radiuk.unmatched_backend_core.model.Character;
import com.radiuk.unmatched_backend_core.model.id.TeamMemberId;
import com.radiuk.unmatched_backend_core.repository.*;
import jakarta.persistence.EntityExistsException;
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
    private final TeamMemberRepository teamMemberRepository;
    private final CharacterRepository characterRepository;
    private final BoardRepository boardRepository;

    @Transactional(readOnly = true)
    public PartyDto getPartyByMatchId(Long matchId) {
        Match match = matchRepository.findById(matchId).orElseThrow(EntityExistsException::new); // todo exception

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

    @Transactional(readOnly = true)
    public List<PartyDto> getAllPartiesByUsername(String username) {
        User user = userRepository.findByUsername(username).orElseThrow(EntityNotFoundException::new);
        List<Long> numberOfParties = partyRepository.getPartiesByUserId(user.getId());

        List<PartyDto> parties = new ArrayList<>();

        for (long numberOfParty = 0L; numberOfParty < numberOfParties.size(); numberOfParty++) {
            parties.add(getPartyByMatchId(numberOfParties.get(Math.toIntExact((numberOfParty)))));
        }

        return parties;
    }

    @Transactional
    public PartyDto createParty(PartyDto partyDto) {
        Board board = boardRepository.findByName(partyDto.getBoardName()).orElseThrow(EntityNotFoundException::new);
        OffsetDateTime date;

        if (partyDto.getDate() == null) {
            date = OffsetDateTime.now();
        }
        else {
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
            User user = userRepository.findByUsername(userPartyDto.getUsername()).orElseThrow(EntityNotFoundException::new);
            Character character = characterRepository.findByName(userPartyDto.getCharacter()).orElseThrow(EntityNotFoundException::new);
            Team team = teamMap.get(getUserTeamName(userPartyDto, partyDto));

            TeamMember teamMember = new TeamMember();
            teamMember.setId(new TeamMemberId(team.getId(), user.getId()));
            teamMember.setTeam(team);
            teamMember.setUser(user);
            teamMember.setCreatedAt(date);
            teamMemberRepository.saveAndFlush(teamMember);

            partyRepository.save(
                    Party.builder()
                            .match(match)
                            .team(team)
                            .user(user)
                            .character(character)
                            .board(board)
                            .moveOrder(userPartyDto.getMoveOrder())
                            .finalHp(userPartyDto.getFinalHp())
                            .isWinner(isUserWin(userPartyDto, partyDto))
                            .createdAt(date)
                            .build()
            );
        }

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
