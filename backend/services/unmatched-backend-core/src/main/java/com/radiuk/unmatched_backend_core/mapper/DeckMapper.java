package com.radiuk.unmatched_backend_core.mapper;

import com.radiuk.unmatched_backend_core.dto.CardDto;
import com.radiuk.unmatched_backend_core.dto.DeckCardDto;
import com.radiuk.unmatched_backend_core.dto.DeckDto;
import com.radiuk.unmatched_backend_core.model.Card;
import com.radiuk.unmatched_backend_core.model.Deck;
import com.radiuk.unmatched_backend_core.model.DeckCard;
import org.mapstruct.Mapper;

import java.util.List;

@Mapper(componentModel = "spring")
public interface DeckMapper {

    CardDto toCardDto(Card card);

    DeckCardDto toDeckCardDto(DeckCard deckCard);

    DeckDto toDto(Deck deck);

    List<DeckDto> toDtos(List<Deck> decks);
}
