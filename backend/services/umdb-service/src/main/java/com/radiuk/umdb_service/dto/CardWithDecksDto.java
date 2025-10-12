package com.radiuk.umdb_service.dto;

import com.radiuk.umdb_service.model.types.CardType;
import lombok.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CardWithDecksDto {

    private String title;

    private CardType type;

    private Short value;

    private String effect;

    private List<CardDeckDto> decks;
}
