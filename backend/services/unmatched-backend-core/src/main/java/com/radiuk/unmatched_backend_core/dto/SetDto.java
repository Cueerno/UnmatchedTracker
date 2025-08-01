package com.radiuk.unmatched_backend_core.dto;

import lombok.*;

import java.time.OffsetDateTime;
import java.util.List;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SetDto {

    private String name;

    private List<CharacterDto> characters;

    private String description;

    private List<BoardDto> boards;

    private OffsetDateTime releaseDate;
}
