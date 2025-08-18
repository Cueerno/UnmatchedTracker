import {API_BASE_URL} from "./config";

const backUrl = `${API_BASE_URL}/dashboard`;

export async function getDashboard() {
    const res = await fetch(`${backUrl}`, {
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