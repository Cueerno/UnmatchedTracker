package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.DeckDto;
import com.radiuk.unmatched_backend_core.dto.DeckRatingDto;
import com.radiuk.unmatched_backend_core.model.Match;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DeckService {

    private final DeckCacheService deckCacheService;

    public List<DeckDto> getAll(String sortBy, String direction) {
        return deckCacheService.getAllFromCache(sortBy, direction);
    }

    public DeckDto getByName(String name) {
        return deckCacheService.getFromCache(name);
    }

    public List<DeckRatingDto> getTop(Match.MatchFormat format) {
        return deckCacheService.getTopFromCache(format);
    }
}
