package com.radiuk.umdb_service.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CardDeckDto {

    private String deckName;

    private String characterName;

    private Short boost;

    private Short quantity;

    private String imageUrl;
}
