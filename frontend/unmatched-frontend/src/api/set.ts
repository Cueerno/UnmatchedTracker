import {API_BASE_URL} from "./config";

const backUrl = `${API_BASE_URL}/umdb/sets`;

export async function getAll(sortBy: string = 'releaseDate', direction: string = 'asc') {
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
