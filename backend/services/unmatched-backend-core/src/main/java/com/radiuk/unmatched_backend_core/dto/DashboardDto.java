package com.radiuk.unmatched_backend_core.dto;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class DashboardDto {

    DashboardSetDto theStrongestSet;

    DashboardSetDto theMostPopularSet;

    DashboardDeckDto theMostPopularDeck;

    DashboardDeckDto theStrongestdDeck;

    DashboardBoardDto theMostPopularBoard;
}
