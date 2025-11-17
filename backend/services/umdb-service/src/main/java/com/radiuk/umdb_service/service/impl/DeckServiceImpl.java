package com.radiuk.umdb_service.service.impl;

import com.radiuk.umdb_service.dto.DeckDto;
import com.radiuk.umdb_service.dto.DeckRatingDto;
import com.radiuk.umdb_service.dto.DeckWithCardsDto;
import com.radiuk.umdb_service.mapper.DeckMapper;
import com.radiuk.umdb_service.model.Match;
import com.radiuk.umdb_service.repository.DeckRepository;
import com.radiuk.umdb_service.service.DeckService;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static com.radiuk.umdb_service.util.SortUtil.getSort;

@Service
@RequiredArgsConstructor
public class DeckServiceImpl implements DeckService {

    private final DeckRepository deckRepository;
    private final DeckMapper deckMapper;

    @Override
    @Cacheable(value = "deckList", key = "#sortBy + ':' + #direction")
    @Transactional(readOnly = true)
    public List<DeckDto> getAll(String sortBy, String direction) {
        return deckMapper.toDtos(deckRepository.findAll(getSort(sortBy, direction)));
    }

    @Override
    @Transactional(readOnly = true)
    @Cacheable(value = "deck", key = "#id")
    public DeckWithCardsDto getById(Short id) {
        return deckRepository.findById(id)
                .map(deckMapper::toDtoWithCards)
                .orElseThrow(() -> new EntityNotFoundException("Deck with id " + id + " not found"));
    }

    @Override
    @Transactional(readOnly = true)
    @Cacheable(value = "deck", key = "#name")
    public DeckWithCardsDto getByName(String name) {
        return deckRepository.findByName(name)
                .map(deckMapper::toDtoWithCards)
                .orElseThrow(() -> new EntityNotFoundException("Deck with name " + name + " not found"));
    }

    @Override
    @Cacheable(value = "deckTop", key = "#format != null ? #format.name() : 'ALL'")
    @Transactional(readOnly = true)
    public List<DeckRatingDto> getTop(Match.MatchFormat format) {
        String formatName = format != null ? format.name() : "%";
        return deckRepository.getTop(formatName);
    }

    @Override
    @Transactional(readOnly = true)
    public List<DeckDto> getRandom(Short quantity) {
        return deckMapper.toDtos(deckRepository.getRandom(PageRequest.of(0, quantity)));
    }
}
