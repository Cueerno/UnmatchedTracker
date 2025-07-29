package com.radiuk.unmatched_backend_core.dto;

import com.radiuk.unmatched_backend_core.model.Match;
import lombok.*;

import java.time.OffsetDateTime;
import java.util.List;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PartyDto {

    private List<UserPartyDto> users;

    private Match.MatchFormat format;

    private List<TeamDto> teams;

    private OffsetDateTime date;

    private String boardName;

    private String winner;
}