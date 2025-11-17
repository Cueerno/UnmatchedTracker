package com.radiuk.umdb_service.service.impl;

import com.radiuk.umdb_service.dto.CardDto;
import com.radiuk.umdb_service.dto.CardWithDecksDto;
import com.radiuk.umdb_service.mapper.CardMapper;
import com.radiuk.umdb_service.repository.CardRepository;
import com.radiuk.umdb_service.service.CardService;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static com.radiuk.umdb_service.util.SortUtil.getSort;

@Service
@RequiredArgsConstructor
public class CardServiceImpl implements CardService {

    private final CardRepository cardRepository;
    private final CardMapper cardMapper;

    @Override
    @Cacheable(value = "cardList", key = "#sortBy + ':' + #direction")
    @Transactional(readOnly = true)
    public List<CardDto> getAll(String sortBy, String direction) {
        return cardMapper.toDtos(cardRepository.findAll(getSort(sortBy, direction)));
    }

    @Override
    @Cacheable(value = "card", key = "#title")
    @Transactional(readOnly = true)
    public CardWithDecksDto getByTitle(String title) {
        return cardRepository.findByTitle(title)
                .map(cardMapper::toDtoWithCards)
                .orElseThrow(() -> new EntityNotFoundException("Card with title " + title + " not found"));
    }
}
