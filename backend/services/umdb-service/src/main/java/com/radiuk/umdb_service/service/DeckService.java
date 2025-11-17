package com.radiuk.umdb_service.service;

import com.radiuk.umdb_service.dto.DeckDto;
import com.radiuk.umdb_service.dto.DeckRatingDto;
import com.radiuk.umdb_service.dto.DeckWithCardsDto;
import com.radiuk.umdb_service.model.Match;

import java.util.List;

public interface DeckService {

    List<DeckDto> getAll(String sortBy, String direction);

    DeckWithCardsDto getById(Short id);

    DeckWithCardsDto getByName(String name);

    List<DeckRatingDto> getTop(Match.MatchFormat format);

    List<DeckDto> getRandom(Short quantity);
}
