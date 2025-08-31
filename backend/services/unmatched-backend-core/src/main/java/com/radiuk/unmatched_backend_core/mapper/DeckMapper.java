package com.radiuk.unmatched_backend_core.mapper;

import com.radiuk.unmatched_backend_core.dto.CardDto;
import com.radiuk.unmatched_backend_core.dto.DeckCardDto;
import com.radiuk.unmatched_backend_core.dto.DeckDto;
import com.radiuk.unmatched_backend_core.model.Card;
import com.radiuk.unmatched_backend_core.model.Deck;
import com.radiuk.unmatched_backend_core.model.DeckCard;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.util.List;

@Mapper(componentModel = "spring")
public interface DeckMapper {

    CardDto toCardDto(Card card);

    List<CardDto> toCardDtos(List<Card> cards);

    DeckCardDto toDeckCardDto(DeckCard deckCard);

    @Mapping(source = "set.name", target = "setName")
    DeckDto toDto(Deck deck);

    List<DeckDto> toDtos(List<Deck> decks);
}
