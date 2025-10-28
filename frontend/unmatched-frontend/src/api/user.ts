import {UserDto} from "../types/user";
import {API_BASE_URL} from "./config";

const backUrl = `${API_BASE_URL}/users`;

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
