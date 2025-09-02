import {BoardDto} from "./board";

export interface HomeDashboardDto {
    theStrongestSet: HomeDashboardSummary;
    theMostPopularSet: HomeDashboardSummary;
    theMostPopularDeck: HomeDashboardSummary;
    theStrongestdDeck: HomeDashboardSummary;
    theMostPopularBoard: BoardDto;
    numberOfUsers: number;
    numberOfParties: number;
    numberOfSets: number;
    numberOfDecks: number;
}

interface HomeDashboardSummary {
    name: string;
    imageUrl: string;
}