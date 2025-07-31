export interface UserPartyDto {
    username: string;
    character: string;
    moveOrder: number;
    finalHp: number;
}

export interface TeamDto {
    name: string;
}

export interface PartyPayload {
    format: string;
    date: string;
    boardName: string;
    users: UserPartyDto[];
    teams: TeamDto[];
    winner: string;
}

export interface Party {
    matchId: number;
    format: string;
    date: string;
    boardName: string;
    users: UserPartyDto[];
    teams: TeamDto[];
    winner: string;
}