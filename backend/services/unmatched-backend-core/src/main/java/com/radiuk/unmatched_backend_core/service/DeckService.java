package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.DeckDto;
import com.radiuk.unmatched_backend_core.dto.DeckRatingDto;
import com.radiuk.unmatched_backend_core.mapper.DeckMapper;
import com.radiuk.unmatched_backend_core.repository.DeckRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static com.radiuk.unmatched_backend_core.util.SortUtil.getSort;

@Service
@RequiredArgsConstructor
public class DeckService {

    private final DeckRepository deckRepository;
    private final DeckMapper deckMapper;

    @Transactional(readOnly = true)
    public List<DeckDto> getAll(String sortBy, String direction) {
        return deckMapper.toDtos(deckRepository.findAll(getSort(sortBy, direction)));
    }

    @Transactional(readOnly = true)
    public List<DeckRatingDto> getTopByWins() {
        return deckRepository.getTopByWins();
    }

    @Transactional(readOnly = true)
    public DeckDto getByName(String name) {
        return deckMapper.toDto(deckRepository.findByName(name).orElseThrow(() -> new EntityNotFoundException("Deck with name" + name + "not found")));
    }
}
