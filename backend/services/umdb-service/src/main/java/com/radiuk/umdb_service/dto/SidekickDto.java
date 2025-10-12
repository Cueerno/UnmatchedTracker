package com.radiuk.umdb_service.dto;

import com.radiuk.umdb_service.model.types.AttackType;
import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SidekickDto {

    private String name;

    private Short quantity;

    private Short hp;

    private Short move;

    private AttackType attackType;

    private String imageUrl;
}
