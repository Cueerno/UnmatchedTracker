import React, { useState } from "react";
import { login } from "../../api/auth";
import { AuthDto } from "../../types/auth";
import "./Login.css";
import {useNavigate} from "react-router-dom";

export default function Login() {
    const navigate = useNavigate();
    const [form, setForm] = useState<AuthDto>({ username: "", password: "" });
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState<string | null>(null);

    const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        setForm({ ...form, [e.target.name]: e.target.value });
    };

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        setLoading(true);
        setError(null);

        try {
            await login(form);

            setTimeout(() => navigate('/'), 1200);
        } catch (err: any) {
            setError(err.message);
        } finally {
            setLoading(false);
        }
    };

    return (
        <div className="auth-container unmatched-theme">
            <form className="auth-form" onSubmit={handleSubmit}>
                <h2 className="auth-title">Login</h2>

                {error && <div className="auth-error">{error}</div>}

                <div className="auth-field">
                    <label htmlFor="username">Username</label>
                    <input
                        type="text"
                        id="username"
                        name="username"
                        value={form.username}
                        onChange={handleChange}
                        required
                    />
                </div>

                <div className="auth-field">
                    <label htmlFor="password">Password</label>
                    <input
                        type="password"
                        id="password"
                        name="password"
                        value={form.password}
                        onChange={handleChange}
                        required
                    />
                </div>

                <button type="submit" className="auth-button" disabled={loading}>
                    {loading ? "Logging in…" : "Login"}
                </button>
            </form>
        </div>
    );
}
