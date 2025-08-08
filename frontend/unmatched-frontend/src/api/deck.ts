import {DeckDto, DeckRatingDto} from "../types/deck";

const backUrl = 'http://localhost:8080/api/v1/umdb';

export async function getAll(sortBy: string = 'name', direction: string = 'asc') {
    const params = new URLSearchParams({sortBy, direction});
    const res = await fetch(`${backUrl}/decks/all?${params}`, {
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
    const res = await fetch(`${backUrl}/decks/${name}`, {
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

export async function getTop(format: string | undefined) {
    const url = new URL(`${backUrl}/decks/top`);

    if (format) {
        url.searchParams.set('format', format);
    }

    const res = await fetch(url.toString(), {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json',
        },
    })

    if (!res.ok) {
        const text = await res.text()
        throw new Error(`Error ${res.status}: ${text}`)
    }

    return await res.json() as Promise<DeckRatingDto[]>
}