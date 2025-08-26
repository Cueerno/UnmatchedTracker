package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.*;
import com.radiuk.unmatched_backend_core.repository.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
@RequiredArgsConstructor
public class DashboardService {

    private final DeckRepository deckRepository;
    private final SetRepository setRepository;
    private final BoardRepository boardRepository;
    private final UserRepository userRepository;
    private final PartyRepository partyRepository;

    @Transactional(readOnly = true)
    @Cacheable(value = "dashboard", key = "'dashboard'")
    public DashboardDto getDashboard() {
        log.debug("[DashboardService] -> getDashboard called");

        DashboardDto dashboard = DashboardDto.builder()
                .theMostPopularSet(setRepository.getTheMostPopular())
                .theStrongestSet(setRepository.getTheStrongest())
                .theMostPopularDeck(deckRepository.getTheMostPopular())
                .theStrongestdDeck(deckRepository.getTheStrongest())
                .theMostPopularBoard(boardRepository.getTheMostPopular())
                .numberOfUsers(userRepository.count())
                .numberOfParties(partyRepository.numberOfPartes())
                .numberOfSets((short) setRepository.count())
                .numberOfDecks((short) deckRepository.count())
                .build();

        log.info("[DashboardService] -> getDashboard finished successfully: mostPopularSet={}, strongestSet={}, mostPopularDeck={}, strongestDeck={}, mostPopularBoard={}",
                dashboard.getTheMostPopularSet(),
                dashboard.getTheStrongestSet(),
                dashboard.getTheMostPopularDeck(),
                dashboard.getTheStrongestdDeck(),
                dashboard.getTheMostPopularBoard()
        );

        return dashboard;
    }
}
