import {API_BASE_URL} from "./config";

const backUrl = `${API_BASE_URL}/umdb/cards`;

export async function getAll() {
    const res = await fetch(`${backUrl}/all`, {
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

export async function getByTitle(title: string) {
    const res = await fetch(`${backUrl}/${title}`, {
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