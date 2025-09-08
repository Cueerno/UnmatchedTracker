package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.CardDto;
import com.radiuk.unmatched_backend_core.mapper.CardMapper;
import com.radiuk.unmatched_backend_core.dto.CardWithDecksDto;
import com.radiuk.unmatched_backend_core.repository.CardRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static com.radiuk.unmatched_backend_core.util.SortUtil.getSort;

@Slf4j
@Service
@RequiredArgsConstructor
public class CardService {

    private final CardRepository cardRepository;
    private final CardMapper cardMapper;

    @Cacheable(value = "cardList", key = "#sortBy + ':' + #direction")
    @Transactional(readOnly = true)
    public List<CardDto> getAll(String sortBy, String direction) {
        log.debug("[CardService] -> getAll called with sortBy={}, direction={}", sortBy, direction);

        List<CardDto> cards = cardMapper.toDtos(cardRepository.findAll(getSort(sortBy, direction)));

        log.info("[CardService] -> getAll finished successfully: found {} cards", cards.size());
        return cards;
    }

    @Cacheable(value = "card", key = "#title")
    @Transactional(readOnly = true)
    public CardWithDecksDto getByTitle(String title) {
        log.debug("[CardService] -> getByTitle called with title={}", title);

        return cardRepository.findByTitle(title).map(card -> {
            CardWithDecksDto cardDto = cardMapper.toDtoWithCards(card);
            log.info("[CardService] -> getByTitle finished successfully: card retrieved with title={}", cardDto.getTitle());
            return cardDto;
        }).orElseThrow(() -> {
            log.warn("[CardService] -> getByTitle entity not found: type=Card, key={}", title);
            return new EntityNotFoundException("Card with title " + title + " not found");
        });
    }
}
