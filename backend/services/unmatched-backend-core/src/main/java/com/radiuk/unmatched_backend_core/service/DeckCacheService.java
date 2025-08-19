package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.DeckDto;
import com.radiuk.unmatched_backend_core.dto.DeckRatingDto;
import com.radiuk.unmatched_backend_core.mapper.DeckMapper;
import com.radiuk.unmatched_backend_core.model.Match;
import com.radiuk.unmatched_backend_core.repository.DeckRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static com.radiuk.unmatched_backend_core.util.SortUtil.getSort;

@Slf4j
@Service
@RequiredArgsConstructor
public class DeckCacheService {

    private final DeckRepository deckRepository;
    private final DeckMapper deckMapper;

    @Cacheable(value = "deckList", key = "#sortBy + ':' + #direction")
    @Transactional(readOnly = true)
    public List<DeckDto> getAllFromCache(String sortBy, String direction) {
        log.debug("[DeckCacheService] -> getAllFromCache called with sortBy={}, direction={}", sortBy, direction);

        List<DeckDto> decks = deckMapper.toDtos(deckRepository.findAll(getSort(sortBy, direction)));

        log.info("[DeckCacheService] -> getAllFromCache finished successfully: found {} decks", decks.size());
        return decks;
    }

    @Cacheable(value = "deck", key = "#name")
    @Transactional(readOnly = true)
    public DeckDto getFromCache(String name) {
        log.debug("[DeckCacheService] -> getFromCache called with name={}", name);

        return deckRepository.findByName(name).map(deck -> {
            DeckDto dto = deckMapper.toDto(deck);
            dto.setSetName(deckRepository.getSetNameByName(name));
            log.info("[DeckCacheService] -> getFromCache finished successfully: deck retrieved with name={}, setName={}", dto.getName(), dto.getSetName());
            return dto;
        }).orElseThrow(() -> {
            log.warn("[DeckCacheService] -> getFromCache entity not found: type=Deck, key={}", name);
            return new EntityNotFoundException("Deck with name " + name + " not found");
        });
    }

    @Cacheable(value = "deckTop", key = "#format != null ? #format.name() : 'ALL'")
    @Transactional(readOnly = true)
    public List<DeckRatingDto> getTopFromCache(Match.MatchFormat format) {
        String formatName = format != null ? format.name() : "%";
        log.debug("[DeckCacheService] -> getTopFromCache called with format={}", formatName);

        List<DeckRatingDto> topDecks = deckRepository.getTop(formatName);

        log.info("[DeckCacheService] -> getTopFromCache finished successfully: found {} top decks (format={})", topDecks.size(), formatName);
        return topDecks;
    }

    @CacheEvict(value = "decksTop", key = "'top'")
    public void evictTopFromCache() {
        log.info("[DeckCacheService] -> evictTopFromCache called: evicting key='top'");
    }
}
