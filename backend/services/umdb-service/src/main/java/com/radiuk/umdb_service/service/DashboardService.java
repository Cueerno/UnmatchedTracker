package com.radiuk.umdb_service.service;

import com.radiuk.umdb_service.dto.HomeDashboardDto;
import com.radiuk.umdb_service.mapper.BoardMapper;
import com.radiuk.umdb_service.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class DashboardService {

    private final DeckRepository deckRepository;
    private final SetRepository setRepository;
    private final BoardRepository boardRepository;
    private final BoardMapper boardMapper;

    @Transactional(readOnly = true)
    @Cacheable(value = "dashboard", key = "'dashboard'")
    public HomeDashboardDto getDashboard() {

        return HomeDashboardDto.builder()
                .theMostPopularSet(setRepository.getTheMostPopular())
                .theStrongestSet(setRepository.getTheStrongest())
                .theMostPopularDeck(deckRepository.getTheMostPopular())
                .theStrongestdDeck(deckRepository.getTheStrongest())
                .theMostPopularBoard(boardMapper.toDto(boardRepository.getTheMostPopular()))
                //.numberOfUsers(userRepository.count())
                .numberOfParties(deckRepository.numberOfPartes())
                .numberOfSets((short) setRepository.count())
                .numberOfDecks((short) deckRepository.count())
                .build();
    }
}
