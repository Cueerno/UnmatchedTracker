export async function getAll(sortBy: string = 'name', direction: string = 'asc') {
    const params = new URLSearchParams({ sortBy, direction });
    const res = await fetch(`http://localhost:8080/api/v1/boards/all?${params}`, {
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