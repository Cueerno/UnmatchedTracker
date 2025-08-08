package com.radiuk.unmatched_backend_core.dto;

import com.radiuk.unmatched_backend_core.model.types.AttackType;
import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class HeroDto {

    private String name;

    private String specialAbility;

    private Short quantity;

    private Short hp;

    private Short move;

    private AttackType attackType;

    private String imageUrl;
}
