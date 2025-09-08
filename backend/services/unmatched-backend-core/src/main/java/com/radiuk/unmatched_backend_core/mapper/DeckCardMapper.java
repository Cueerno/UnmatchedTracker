package com.radiuk.unmatched_backend_core.mapper;

import com.radiuk.unmatched_backend_core.dto.CardDeckDto;
import com.radiuk.unmatched_backend_core.dto.DeckCardDto;
import com.radiuk.unmatched_backend_core.model.DeckCard;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring", uses = {CardMapper.class})
public interface DeckCardMapper {

    @Mapping(source = "deck.name", target = "deckName")
    @Mapping(source = "characterName", target = "characterName")
    @Mapping(source = "boost", target = "boost")
    @Mapping(source = "quantity", target = "quantity")
    @Mapping(source = "imageUrl", target = "imageUrl")
    @Mapping(source = "card", target = "card")
    DeckCardDto toDto(DeckCard deckCard);

    @Mapping(source = "deck.name", target = "deckName")
    @Mapping(source = "characterName", target = "characterName")
    @Mapping(source = "boost", target = "boost")
    @Mapping(source = "quantity", target = "quantity")
    @Mapping(source = "imageUrl", target = "imageUrl")
    CardDeckDto toCardDeckDto(DeckCard deckCard);
}
