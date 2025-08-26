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
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static com.radiuk.unmatched_backend_core.util.SortUtil.getSort;

@Slf4j
@Service
@RequiredArgsConstructor
public class DeckService {

    private final DeckRepository deckRepository;
    private final DeckMapper deckMapper;

    @Cacheable(value = "deckList", key = "#sortBy + ':' + #direction")
    @Transactional(readOnly = true)
    public List<DeckDto> getAll(String sortBy, String direction) {
        log.debug("[DeckService] -> getAll called with sortBy={}, direction={}", sortBy, direction);

        List<DeckDto> decks = deckMapper.toDtos(deckRepository.findAll(getSort(sortBy, direction)));

        log.info("[DeckService] -> getAll finished successfully: found {} decks", decks.size());
        return decks;
    }

    @Cacheable(value = "deck", key = "#name")
    @Transactional(readOnly = true)
    public DeckDto getByName(String name) {
        log.debug("[DeckService] -> getByName called with name={}", name);

        return deckRepository.findByName(name).map(deck -> {
            DeckDto dto = deckMapper.toDto(deck);
            dto.setSetName(deckRepository.getSetNameByName(name));
            log.info("[DeckService] -> getByName finished successfully: deck retrieved with name={}, setName={}", dto.getName(), dto.getSetName());
            return dto;
        }).orElseThrow(() -> {
            log.warn("[DeckService] -> getByName entity not found: type=Deck, key={}", name);
            return new EntityNotFoundException("Deck with name " + name + " not found");
        });
    }

    @Cacheable(value = "deckTop", key = "#format != null ? #format.name() : 'ALL'")
    @Transactional(readOnly = true)
    public List<DeckRatingDto> getTop(Match.MatchFormat format) {
        String formatName = format != null ? format.name() : "%";
        log.debug("[DeckService] -> getTop called with format={}", formatName);

        List<DeckRatingDto> topDecks = deckRepository.getTop(formatName);

        log.info("[DeckService] -> getTop finished successfully: found {} top decks (format={})", topDecks.size(), formatName);
        return topDecks;
    }

    @Transactional(readOnly = true)
    public List<DeckDto> getRandom(Short quantity) {
        log.debug("[DeckService] -> getRandom called with quantity={}", quantity);
        List<DeckDto> decks = deckMapper.toDtos(deckRepository.getRandom(PageRequest.of(0, quantity)));
        log.info("[DeckService] -> getRandom finished successfully: {} decks retrieved", decks.size());
        return decks;
    }

    @CacheEvict(value = "decksTop", key = "'top'")
    public void evictTopFromCache() {
        log.info("[DeckService] -> evictTopFromCache called: evicting key='top'");
    }
}
