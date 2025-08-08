package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.DeckDto;
import com.radiuk.unmatched_backend_core.dto.DeckRatingDto;
import com.radiuk.unmatched_backend_core.mapper.DeckMapper;
import com.radiuk.unmatched_backend_core.model.Match;
import com.radiuk.unmatched_backend_core.repository.DeckRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static com.radiuk.unmatched_backend_core.util.SortUtil.getSort;

@Service
@RequiredArgsConstructor
public class DeckCacheService {

    private final DeckRepository deckRepository;
    private final DeckMapper deckMapper;

    @Cacheable(value = "deckList", key = "#sortBy + ':' + #direction")
    @Transactional(readOnly = true)
    public List<DeckDto> getAllFromCache(String sortBy, String direction) {
        return deckMapper.toDtos(deckRepository.findAll(getSort(sortBy, direction)));
    }

    @Cacheable(value = "deck", key = "#name")
    @Transactional(readOnly = true)
    public DeckDto getFromCache(String name) {
        DeckDto deckDto = deckMapper.toDto(deckRepository.findByName(name).orElseThrow(() -> new EntityNotFoundException("Deck with name " + name + " not found")));
        deckDto.setSetName(deckRepository.getSetNameByName(name));
        return deckDto;
    }

    @Cacheable(value = "deckTop", key = "#format != null ? #format.name() : 'ALL'")
    @Transactional(readOnly = true)
    public List<DeckRatingDto> getTopFromCache(Match.MatchFormat format) {
        String formatName = format != null ? format.name() : "%";
        return deckRepository.getTop(formatName);
    }

    @CacheEvict(value = "decksTop", key = "'top'")
    public void evictTopFromCache() {
        System.out.println("Evicting all-top decks");
    }
}
