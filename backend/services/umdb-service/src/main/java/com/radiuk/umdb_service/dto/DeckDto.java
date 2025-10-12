package com.radiuk.umdb_service.dto;

import lombok.*;

import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
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

    private Set<RuleCardDto> ruleCards = new HashSet<>();

    private Set<ExtraCharacterDto> extraCharacters = new HashSet<>();
}
