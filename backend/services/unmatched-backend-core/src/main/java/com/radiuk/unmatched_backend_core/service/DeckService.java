package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.DeckDto;
import com.radiuk.unmatched_backend_core.dto.DeckRatingDto;
import com.radiuk.unmatched_backend_core.mapper.DeckMapper;
import com.radiuk.unmatched_backend_core.model.Match;
import com.radiuk.unmatched_backend_core.repository.DeckRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class DeckService {

    private final DeckCacheService deckCacheService;
    private final DeckRepository deckRepository;
    private final DeckMapper deckMapper;

    public List<DeckDto> getAll(String sortBy, String direction) {
        log.debug("[DeckService] -> getAll called with sortBy={}, direction={}", sortBy, direction);
        List<DeckDto> decks = deckCacheService.getAllFromCache(sortBy, direction);
        log.info("[DeckService] -> getAll finished successfully: {} decks retrieved", decks.size());
        return decks;
    }

    public DeckDto getByName(String name) {
        log.debug("[DeckService] -> getByName called with name={}", name);
        DeckDto deck = deckCacheService.getFromCache(name);
        log.info("[DeckService] -> getByName finished successfully: deck={}", deck.getName());
        return deck;
    }

    public List<DeckRatingDto> getTop(Match.MatchFormat format) {
        log.debug("[DeckService] -> getTop called with format={}", format);
        List<DeckRatingDto> decks = deckCacheService.getTopFromCache(format);
        log.info("[DeckService] -> getTop finished successfully: {} decks retrieved", decks.size());
        return decks;
    }

    public List<DeckDto> getRandom(Short quantity) {
        log.debug("[DeckService] -> getRandom called with quantity={}", quantity);
        List<DeckDto> decks = deckMapper.toDtos(deckRepository.getRandom(PageRequest.of(0, quantity)));
        log.info("[DeckService] -> getRandom finished successfully: {} decks retrieved", decks.size());
        return decks;
    }
}
