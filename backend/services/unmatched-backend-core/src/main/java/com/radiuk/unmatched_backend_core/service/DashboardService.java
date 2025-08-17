package com.radiuk.unmatched_backend_core.service;

import com.radiuk.unmatched_backend_core.dto.*;
import com.radiuk.unmatched_backend_core.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class DashboardService {

    private final DeckRepository deckRepository;
    private final SetRepository setRepository;
    private final BoardRepository boardRepository;

    @Transactional(readOnly = true)
    public DashboardDto getDashboard() {
        return DashboardDto.builder()
                .theMostPopularSet(setRepository.getTheMostPopular())
                .theStrongestSet(setRepository.getTheStrongest())
                .theMostPopularDeck(deckRepository.getTheMostPopular())
                .theStrongestdDeck(deckRepository.getTheStrongest())
                .theMostPopularBoard(boardRepository.getTheMostPopular())
                .build();
    }
}
