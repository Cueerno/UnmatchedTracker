package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.CardDto;
import com.radiuk.unmatched_backend_core.dto.CardWithDecksDto;
import com.radiuk.unmatched_backend_core.mapper.CardMapper;
import com.radiuk.unmatched_backend_core.repository.CardRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static com.radiuk.unmatched_backend_core.util.SortUtil.getSort;

@Service
@RequiredArgsConstructor
public class CardService {

    private final CardRepository cardRepository;
    private final CardMapper cardMapper;

    @Cacheable(value = "cardList", key = "#sortBy + ':' + #direction")
    @Transactional(readOnly = true)
    public List<CardDto> getAll(String sortBy, String direction) {
        return cardMapper.toDtos(cardRepository.findAll(getSort(sortBy, direction)));
    }

    @Cacheable(value = "card", key = "#title")
    @Transactional(readOnly = true)
    public CardWithDecksDto getByTitle(String title) {
        return cardRepository.findByTitle(title)
                .map(cardMapper::toDtoWithCards)
                .orElseThrow(() -> new EntityNotFoundException("Card with title " + title + " not found"));
    }
}
