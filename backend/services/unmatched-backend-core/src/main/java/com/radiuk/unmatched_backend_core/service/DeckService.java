package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.DeckDto;
import com.radiuk.unmatched_backend_core.dto.DeckRatingDto;
import com.radiuk.unmatched_backend_core.model.Match;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DeckService {

    private final DeckCacheService deckCacheService;

    @Transactional(readOnly = true)
    public List<DeckDto> getAll(String sortBy, String direction) {
        return deckCacheService.getAllFromCache(sortBy, direction);
    }

    @Transactional(readOnly = true)
    public DeckDto getByName(String name) {
        return deckCacheService.getFromCache(name);
    }

    @Transactional(readOnly = true)
    public List<DeckRatingDto> getTop(Match.MatchFormat format) {
        return deckCacheService.getTopFromCache(format);
    }
}
