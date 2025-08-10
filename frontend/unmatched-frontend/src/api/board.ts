import {BoardDto} from "../types/board";
import {API_BASE_URL} from "./config";

const backUrl = `${API_BASE_URL}/umdb/boards`;

export async function getAll(sortBy: string = 'name', direction: string = 'asc') {
    const params = new URLSearchParams({ sortBy, direction });
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


export async function getNames(): Promise<string[]> {
    const boards:BoardDto[] = await getAll('name', 'asc');
    return boards.map(b => b.name);
}