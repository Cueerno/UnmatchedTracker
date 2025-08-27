package com.radiuk.unmatched_backend_core.dto;

import lombok.*;

import java.util.List;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class DeckDto {

    private String setName;

    private String name;

    private String notes;

    private String quote;

    private String artImageUrl;

    private String frontImageUrl;

    private String backImageUrl;

    private HeroDto hero;

    private SidekickDto sidekick;

    private List<DeckCardDto> cards;

    private List<RuleCardDto> ruleCards;

    private List<ExtraCharacterDto> extraCharacters;
}
