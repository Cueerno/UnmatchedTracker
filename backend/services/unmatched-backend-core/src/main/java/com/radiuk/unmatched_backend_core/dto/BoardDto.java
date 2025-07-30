package com.radiuk.unmatched_backend_core.dto;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BoardDto {

    private String name;

    private Short maxPlayers;

    private Short spaces;

    private Short zones;

    private String feature;

    private String imageUrl;
}
