import {DeckDto, DeckRatingDto} from "../types/deck";
import {API_BASE_URL} from "./config";

const backUrl = `${API_BASE_URL}/umdb/decks`;

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

export async function getTop(format: string | undefined) {
    const url = new URL(`${backUrl}/top`);

    console.log(url);

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