package com.radiuk.party_service.dto;

import com.radiuk.party_service.model.Match;
import lombok.*;

import java.time.OffsetDateTime;
import java.util.List;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PartyDto {

    private Long matchId;

    private Match.MatchFormat format;

    private OffsetDateTime date;

    private String boardName;

    private List<UserPartyDto> users;

    private List<TeamDto> teams;

    private String winner;
}