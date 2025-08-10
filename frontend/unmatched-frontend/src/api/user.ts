import {UserDto} from "../types/user";
import {API_BASE_URL} from "./config";

const backUrl = `${API_BASE_URL}/users`;

export async function getUserParties(username: string) {
    const res = await fetch(`${backUrl}/${username}/parties`, {
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

export async function createUser(user: UserDto) {
    const res = await fetch(`${backUrl}`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(user),
    })

    if (!res.ok) {
        const text = await res.text()
        throw new Error(`Error ${res.status}: ${text}`)
    }

    return res.json()
}
