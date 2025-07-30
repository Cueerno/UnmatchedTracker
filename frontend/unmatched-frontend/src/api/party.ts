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

export async function getPartyByMatchId(matchId: number) {
    const res = await fetch(`http://localhost:8080/api/v1/parties/${matchId}`, {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json',
        },
    })

    if (!res.ok) {
        const text = await res.text()
        throw new Error(`Error ${res.status}: ${text}`)
    }

    return res.json()
}

export async function createParty(party: PartyPayload) {
    const res = await fetch(`http://localhost:8080/api/v1/parties`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(party),
    })

    if (!res.ok) {
        const text = await res.text()
        throw new Error(`Error ${res.status}: ${text}`)
    }

    return res.json()
}