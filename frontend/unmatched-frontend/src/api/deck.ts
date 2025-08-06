export async function getAll(sortBy: string = 'name', direction: string = 'asc') {
    const params = new URLSearchParams({sortBy, direction});
    const res = await fetch(`http://localhost:8080/api/v1/decks/all?${params}`, {
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
    const res = await fetch(`http://localhost:8080/api/v1/decks/${name}`, {
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

export async function getTopByWins() {
    const res = await fetch(`http://localhost:8080/api/v1/decks/top`, {
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