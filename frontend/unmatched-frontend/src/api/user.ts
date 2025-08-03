import {UserDto} from "../types/user";

export async function getUserParties(username: string) {
    const res = await fetch(`http://localhost:8080/api/v1/users/${username}/parties`, {
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
    const res = await fetch('http://localhost:8080/api/v1/users', {
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
}