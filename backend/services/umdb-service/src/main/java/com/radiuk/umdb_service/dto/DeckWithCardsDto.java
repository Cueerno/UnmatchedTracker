package com.radiuk.umdb_service.dto;

import lombok.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DeckWithCardsDto {

    private Short id;

    private String setName;

    private String name;

    private String notes;

    private String quote;

    private String artImageUrl;

    private String frontImageUrl;

    private String backImageUrl;

    private HeroDto hero;

    private SidekickDto sidekick;

    private List<RuleCardDto> ruleCards;

    private List<ExtraCharacterDto> extraCharacters;

    private List<DeckCardDto> cards;
}
