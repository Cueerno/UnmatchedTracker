import {AUTH_API_BASE_URL} from "./config";
import {AuthDto, RegistrationDto} from "../types/auth";

const backUrl = `${AUTH_API_BASE_URL}/auth`;

export async function signUp(user: RegistrationDto) {
    const res = await fetch(`${backUrl}/register`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(user)
    })

    if (!res.ok) {
        const text = await res.text()
        throw new Error(`Error ${res.status}: ${text}`)
    }

    return res.json()
}

export async function login(user: AuthDto) {
    const res = await fetch(`${backUrl}/login`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(user)
    })

    if (!res.ok) {
        const text = await res.text()
        throw new Error(`Error ${res.status}: ${text}`)
    }

    return res.json()
}