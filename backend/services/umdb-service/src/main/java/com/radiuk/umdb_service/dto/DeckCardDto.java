package com.radiuk.umdb_service.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DeckCardDto {

    private String deckName;

    private String characterName;

    private Short boost;

    private Short quantity;

    private String imageUrl;

    private CardDto card;
}
