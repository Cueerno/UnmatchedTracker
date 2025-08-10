import {PartyPayload} from "../types/party";
import {API_BASE_URL} from "./config";

const backUrl = `${API_BASE_URL}/parties`;

export async function getPartyByMatchId(matchId: number) {
    const res = await fetch(`${backUrl}/${matchId}`, {
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
    const res = await fetch(`${backUrl}`, {
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
