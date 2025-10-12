package com.radiuk.umdb_service.mapper;

import com.radiuk.umdb_service.dto.DeckDto;
import com.radiuk.umdb_service.dto.DeckWithCardsDto;
import com.radiuk.umdb_service.model.Deck;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.util.List;

@Mapper(componentModel = "spring")
public interface DeckMapper {

    @Mapping(source = "set.name", target = "setName")
    DeckDto toDto(Deck deck);

    @Mapping(source = "set.name", target = "setName")
    @Mapping(source = "cards", target = "cards")
    @Mapping(source = "ruleCards", target = "ruleCards")
    @Mapping(source = "extraCharacters", target = "extraCharacters")
    @Mapping(source = "hero", target = "hero")
    @Mapping(source = "sidekick", target = "sidekick")
    DeckWithCardsDto toDtoWithCards(Deck deck);

    List<DeckDto> toDtos(List<Deck> decks);
}
