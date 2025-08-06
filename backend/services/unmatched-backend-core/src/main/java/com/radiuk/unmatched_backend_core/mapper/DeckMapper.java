package com.radiuk.unmatched_backend_core.mapper;

import com.radiuk.unmatched_backend_core.dto.DeckDto;
import com.radiuk.unmatched_backend_core.model.Deck;
import org.mapstruct.Mapper;

import java.util.List;

@Mapper(componentModel = "spring")
public interface DeckMapper {

    DeckDto toDto(Deck deck);

    List<DeckDto> toDtos(List<Deck> decks);
}
