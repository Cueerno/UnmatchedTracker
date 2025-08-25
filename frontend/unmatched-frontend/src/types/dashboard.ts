export interface DashboardDto {
    theStrongestSet: DashboardSetDto;
    theMostPopularSet: DashboardSetDto;
    theMostPopularDeck: DashboardDeckDto;
    theStrongestdDeck: DashboardDeckDto;
    theMostPopularBoard: DashboardBoardDto;
    numberOfUsers: number;
    numberOfParties: number;
    numberOfSets: number;
    numberOfDecks: number;
}

interface DashboardSetDto {
    name: string;
    imageUrl: string;
}

interface DashboardDeckDto {
    name: string;
    artImageUrl: string;
}

interface DashboardBoardDto {
    name: string;
    maxPlayers: number;
    spaces: number;
    zones: number;
    imageUrl: string;
}

