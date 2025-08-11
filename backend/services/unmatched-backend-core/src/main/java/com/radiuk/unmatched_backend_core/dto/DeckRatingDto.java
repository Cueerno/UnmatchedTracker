package com.radiuk.unmatched_backend_core.dto;

import lombok.*;

import java.math.BigDecimal;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class DeckRatingDto {

    private Long rating;

    private String name;

    private Long winCount;

    private Long totalCount;

    private BigDecimal winRatePercent;
}
