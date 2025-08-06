package com.radiuk.unmatched_backend_core.dto;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserPartyDto {

    private String username;
    private String deck;
    private Short moveOrder;
    private Short finalHp;
}
