package com.radiuk.umdb_service.service;

import com.radiuk.umdb_service.dto.DeckDto;
import com.radiuk.umdb_service.dto.DeckRatingDto;
import com.radiuk.umdb_service.dto.DeckWithCardsDto;
import com.radiuk.umdb_service.mapper.DeckMapper;
import com.radiuk.umdb_service.model.Match;
import com.radiuk.umdb_service.repository.DeckRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static com.radiuk.umdb_service.util.SortUtil.getSort;

@Service
@RequiredArgsConstructor
public class DeckService {

    private final DeckRepository deckRepository;
    private final DeckMapper deckMapper;

    @Cacheable(value = "deckList", key = "#sortBy + ':' + #direction")
    @Transactional(readOnly = true)
    public List<DeckDto> getAll(String sortBy, String direction) {
        return deckMapper.toDtos(deckRepository.findAll(getSort(sortBy, direction)));
    }

    @Cacheable(value = "deck", key = "#name")
    @Transactional(readOnly = true)
    public DeckWithCardsDto getByName(String name) {
        return deckRepository.findByName(name)
                .map(deckMapper::toDtoWithCards)
                .orElseThrow(() -> new EntityNotFoundException("Deck with name " + name + " not found"));
    }

    @Cacheable(value = "deckTop", key = "#format != null ? #format.name() : 'ALL'")
    @Transactional(readOnly = true)
    public List<DeckRatingDto> getTop(Match.MatchFormat format) {
        String formatName = format != null ? format.name() : "%";
        return deckRepository.getTop(formatName);
    }

    @Transactional(readOnly = true)
    public List<DeckDto> getRandom(Short quantity) {
        return deckMapper.toDtos(deckRepository.getRandom(PageRequest.of(0, quantity)));
    }

    @CacheEvict(value = "decksTop", key = "'top'")
    public void evictTopFromCache() {

    }
}
