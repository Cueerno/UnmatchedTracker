package com.radiuk.unmatched_backend_core.dto;

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

    private List<TeamDto> teams;

    private OffsetDateTime date;

    private String boardName;

    private String winner;
}