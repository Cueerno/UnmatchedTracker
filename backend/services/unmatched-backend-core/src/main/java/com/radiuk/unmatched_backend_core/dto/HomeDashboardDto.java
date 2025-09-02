package com.radiuk.unmatched_backend_core.dto;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class HomeDashboardDto {

    private HomeDashboardSummary theStrongestSet;

    private HomeDashboardSummary theMostPopularSet;

    private HomeDashboardSummary theMostPopularDeck;

    private HomeDashboardSummary theStrongestdDeck;

    private BoardDto theMostPopularBoard;

    private Long numberOfUsers;

    private Long numberOfParties;

    private Short numberOfSets;

    private Short numberOfDecks;
}
