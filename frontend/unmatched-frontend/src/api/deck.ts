import {DeckDto, DeckRatingDto} from "../types/deck";
import {UMDB_API_BASE_URL} from "./config";

const backUrl = `${UMDB_API_BASE_URL}/decks`;

export async function getTop(format: string | undefined) {
    const url = new URL(`${backUrl}/top`);

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

export async function getRandom(quantity: number) {
    const res = await fetch(`${backUrl}/random?quantity=${quantity}`, {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json',
        },
    });

    if (!res.ok) {
        const text = await res.text();
        throw new Error(`Error ${res.status}: ${text}`);
    }

    return res.json();
}