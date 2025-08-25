package com.radiuk.unmatched_backend_core.dto;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class DashboardDto {

    private DashboardSetDto theStrongestSet;

    private DashboardSetDto theMostPopularSet;

    private DashboardDeckDto theMostPopularDeck;

    private DashboardDeckDto theStrongestdDeck;

    private DashboardBoardDto theMostPopularBoard;

    private Long numberOfUsers;

    private Long numberOfParties;

    private Short numberOfSets;

    private Short numberOfDecks;
}
