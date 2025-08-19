package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.DashboardDto;
import com.radiuk.unmatched_backend_core.repository.BoardRepository;
import com.radiuk.unmatched_backend_core.repository.DeckRepository;
import com.radiuk.unmatched_backend_core.repository.SetRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
@RequiredArgsConstructor
public class DashboardCacheService {

    private final DeckRepository deckRepository;
    private final SetRepository setRepository;
    private final BoardRepository boardRepository;

    @Transactional(readOnly = true)
    @Cacheable(value = "dashboard", key = "'dashboard'")
    public DashboardDto getDashboard() {
        log.debug("[DashboardCacheService] -> getDashboard called");

        DashboardDto dashboard = DashboardDto.builder()
                .theMostPopularSet(setRepository.getTheMostPopular())
                .theStrongestSet(setRepository.getTheStrongest())
                .theMostPopularDeck(deckRepository.getTheMostPopular())
                .theStrongestdDeck(deckRepository.getTheStrongest())
                .theMostPopularBoard(boardRepository.getTheMostPopular())
                .build();

        log.info("[DashboardCacheService] -> getDashboard finished successfully: mostPopularSet={}, strongestSet={}, mostPopularDeck={}, strongestDeck={}, mostPopularBoard={}",
                dashboard.getTheMostPopularSet(),
                dashboard.getTheStrongestSet(),
                dashboard.getTheMostPopularDeck(),
                dashboard.getTheStrongestdDeck(),
                dashboard.getTheMostPopularBoard()
        );

        return dashboard;
    }
}
