package com.radiuk.unmatched_backend_core.dto;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CharacterRatingDto {

    private Long rating;

    private String name;

    private Long win_count;
}
