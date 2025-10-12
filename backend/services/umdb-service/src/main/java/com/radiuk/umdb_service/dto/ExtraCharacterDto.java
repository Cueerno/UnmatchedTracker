package com.radiuk.umdb_service.dto;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ExtraCharacterDto {

    private String name;

    private String specialAbility;

    private Short quantity;

    private Short hp;

    private Short move;

    private String attackType;

    private String imageUrl;
}
