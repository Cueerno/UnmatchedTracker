package com.radiuk.umdb_service.dto;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BoardDto {

    private Short id;

    private String name;

    private Short maxPlayers;

    private Short spaces;

    private Short zones;

    private String feature;

    private String imageUrl;
}
