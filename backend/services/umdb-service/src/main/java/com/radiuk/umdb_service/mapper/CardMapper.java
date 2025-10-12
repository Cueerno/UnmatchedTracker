package com.radiuk.umdb_service.mapper;

import com.radiuk.umdb_service.dto.CardDeckDto;
import com.radiuk.umdb_service.dto.CardDto;
import com.radiuk.umdb_service.dto.CardWithDecksDto;
import com.radiuk.umdb_service.model.Card;
import com.radiuk.umdb_service.model.DeckCard;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.util.List;

@Mapper(componentModel = "spring")
public interface CardMapper {

    CardDto toDto(Card card);

    CardWithDecksDto toDtoWithCards(Card card);

    @Mapping(source = "deck.name", target = "deckName")
    @Mapping(source = "characterName", target = "characterName")
    @Mapping(source = "boost", target = "boost")
    @Mapping(source = "quantity", target = "quantity")
    @Mapping(source = "imageUrl", target = "imageUrl")
    CardDeckDto deckCardToCardDeckDto(DeckCard deckCard);

    List<CardDto> toDtos(List<Card> cards);
}
