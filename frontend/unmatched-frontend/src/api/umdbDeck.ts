import {DeckDto, DeckRatingDto} from "../types/deck";
import {UMDB_API_BASE_URL} from "./config";

const backUrl = `${UMDB_API_BASE_URL}/umdb/decks`;

export async function getAll(sortBy: string = 'name', direction: string = 'asc') {
    const params = new URLSearchParams({sortBy, direction});
    const res = await fetch(`${backUrl}/all?${params}`, {
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

export async function getByName(name: string) {
    const res = await fetch(`${backUrl}/${name}`, {
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

export async function getNames(): Promise<string[]> {
    const decks: DeckDto[] = await getAll();
    return decks.map(d => d.name);
}