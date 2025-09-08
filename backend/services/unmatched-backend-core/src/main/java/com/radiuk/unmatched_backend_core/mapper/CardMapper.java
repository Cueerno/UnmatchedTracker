package com.radiuk.unmatched_backend_core.mapper;

import com.radiuk.unmatched_backend_core.dto.CardDeckDto;
import com.radiuk.unmatched_backend_core.dto.CardWithDecksDto;
import com.radiuk.unmatched_backend_core.model.Card;
import com.radiuk.unmatched_backend_core.dto.CardDto;
import com.radiuk.unmatched_backend_core.model.DeckCard;
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
