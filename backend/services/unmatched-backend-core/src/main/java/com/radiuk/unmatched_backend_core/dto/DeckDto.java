package com.radiuk.unmatched_backend_core.dto;

import lombok.*;

import java.util.List;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class DeckDto {

    private String name;

    private String frontImageUrl;

    private String backImageUrl;

    private String notes;

    private HeroDto hero;

    private SidekickDto sidekick;

    private List<CardDto> cards;

    private List<RuleCardDto> ruleCards;

    private List<ExtraCharacterDto> extraCharacters;
}
