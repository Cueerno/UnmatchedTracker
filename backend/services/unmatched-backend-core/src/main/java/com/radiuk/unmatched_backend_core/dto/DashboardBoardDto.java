package com.radiuk.unmatched_backend_core.dto;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class DashboardBoardDto {

    private String name;

    private Short maxPlayers;

    private Short spaces;

    private Short zones;

    private String imageUrl;
}
