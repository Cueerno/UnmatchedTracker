import React, {useEffect, useState} from 'react';
import {signUp} from '../../api/auth';
import {RegistrationDto} from '../../types/auth';
import {useNavigate} from 'react-router-dom';
import './SignUp.css';

export default function SignUp({onRegistered}: { onRegistered?: (data: any) => void }) {
    const navigate = useNavigate();

    const [username, setUsername] = useState('');
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [confirm, setConfirm] = useState('');
    const [agree, setAgree] = useState(false);

    const [showPassword, setShowPassword] = useState(false);
    const [loading, setLoading] = useState(false);
    const [serverError, setServerError] = useState<string | null>(null);
    const [success, setSuccess] = useState(false);

    const [errors, setErrors] = useState<Record<string, string>>({});

    const strength = calcPasswordStrength(password);

    useEffect(() => {
        const e: Record<string, string> = {};
        if (username.trim().length < 3) e.username = 'The username must be at least 2 characters long.';
        if (!validateEmail(email)) e.email = 'Incorrect e-mail';
        if (password.length < 8) e.password = 'Password must be at least 8 characters long';
        if (password !== confirm) e.confirm = 'The passwords don\'t match';
        if (!agree) e.agree = 'You must agree to the rules';
        setErrors(e);
    }, [username, email, password, confirm, agree]);

    const canSubmit = Object.keys(errors).length === 0 && !loading;

    async function handleSubmit(e: React.FormEvent) {
        e.preventDefault();
        if (!canSubmit) return;
        setLoading(true);
        setServerError(null);
        try {
            const dto: RegistrationDto = {username: username.trim(), email: email.trim(), password};
            const res = await signUp(dto);
            setSuccess(true);
            onRegistered?.(res);

            setTimeout(() => navigate('/login'), 1200);
        } catch (err: any) {
            setServerError(err?.message ?? 'Registration error');
        } finally {
            setLoading(false);
        }
    }

    return (
        <div className="signup-page" role="main">
            <div className="signup-hero" aria-hidden>
                {/* background */}
            </div>

            <div className="signup-card" aria-labelledby="signup-title">
                <header className="signup-header">
                    <img src="/images/unmatched-emblem.png" alt="" className="signup-logo"/>
                    <h1 id="signup-title">Sign Up — Unmatched Vault</h1>
                    <p className="signup-sub">Join the arena. Track decks, cards and battles.</p>
                </header>

                <form className="signup-form" onSubmit={handleSubmit} noValidate>
                    <div className="field-row">
                        <label>
                            Username
                            <input
                                type={"text"}
                                value={username}
                                onChange={e => setUsername(e.target.value)}
                                placeholder="Your name in the arena"
                                aria-invalid={!!errors.username}
                                required
                            />
                            {errors.username && <div className="field-error">{errors.username}</div>}
                        </label>

                        <label>
                            Email
                            <input
                                type="email"
                                value={email}
                                onChange={e => setEmail(e.target.value)}
                                placeholder="you@example.com"
                                aria-invalid={!!errors.email}
                                required
                            />
                            {errors.email && <div className="field-error">{errors.email}</div>}
                        </label>
                    </div>

                    <div className="field-row">
                        <label>
                            Password
                            <div className="password-wrap">
                                <input
                                    type={showPassword ? 'text' : 'password'}
                                    value={password}
                                    onChange={e => setPassword(e.target.value)}
                                    placeholder="Minimum 8 characters"
                                    aria-invalid={!!errors.password}
                                    required
                                />
                                <button
                                    type="button"
                                    className="toggle-visibility"
                                    aria-label={showPassword ? 'Hide password' : 'Show password'}
                                    onClick={() => setShowPassword(s => !s)}
                                >
                                    {showPassword ? '🙈' : '👁️'}
                                </button>
                            </div>
                            {errors.password && <div className="field-error">{errors.password}</div>}
                        </label>

                        <label>
                            Confirm
                            <input
                                type="password"
                                value={confirm}
                                onChange={e => setConfirm(e.target.value)}
                                placeholder="Repeat your password"
                                aria-invalid={!!errors.confirm}
                                required
                            />
                            {errors.confirm && <div className="field-error">{errors.confirm}</div>}
                        </label>
                    </div>

                    <div className="password-meter" aria-hidden>
                        <div className={`meter-bar score-${strength.score}`}
                             style={{'--score': strength.score} as React.CSSProperties}></div>
                        <div className="meter-label">{strength.label}</div>
                    </div>

                    <div className="form-bottom">
                        <label className="agree">
                            <input type="checkbox" checked={agree} onChange={e => setAgree(e.target.checked)}/>
                            I agree with the <a href="/terms" target="_blank" rel="noreferrer">Terms & Privacy</a>
                        </label>

                        <div className="actions">
                            <button type="submit" className="btn-primary" disabled={!canSubmit}>
                                {loading ? 'Signing up…' : 'Sign Up'}
                            </button>
                        </div>
                    </div>

                    {serverError &&
                        <div className="server-error" role="alert" aria-live="assertive">{serverError}</div>}
                    {success &&
                        <div className="server-success" role="status">Registration successful — redirecting…</div>}
                </form>

                <footer className="signup-footer">
                    <small>Already have an account? <a href="/login">Log in</a></small>
                </footer>
            </div>
        </div>
    );
}


function validateEmail(email: string) {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}

function calcPasswordStrength(pw: string) {
    let score = 0;
    if (pw.length >= 8) score++;
    if (/[A-Z]/.test(pw)) score++;
    if (/[0-9]/.test(pw)) score++;
    if (/[^A-Za-z0-9]/.test(pw)) score++;
    const labels = ['Very weak', 'Weak', 'Fair', 'Good', 'Strong'];
    return {score, label: labels[score]};
}
