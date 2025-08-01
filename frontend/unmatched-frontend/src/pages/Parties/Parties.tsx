import React, { useState, FormEvent } from 'react';
import { Link } from 'react-router-dom';
import {useNavigate} from 'react-router-dom';
import {getUserParties} from '../../api/party'
import {Party} from "../../types/party";

export function Parties() {
    const [username, setUsername] = useState<string>('');
    const [parties, setParties] = useState<Party[]>([]);
    const [loading, setLoading] = useState<boolean>(false);
    const [error, setError] = useState<string | null>(null);
    const navigate = useNavigate();

    const handleSubmit = async (e: FormEvent) => {
        e.preventDefault();
        if (!username.trim()) {
            setError('Enter username');
            return;
        }

        setLoading(true);
        setError(null);

        try {
            const data = await getUserParties(username.trim());
            setParties(data);
        } catch (err: any) {
            setError(err.message || 'Failed to load data');
            setParties([]);
        } finally {
            setLoading(false);
        }
    };

    return (
        <div style={{ padding: '20px' }}>
            <h1>Add new party</h1>
            <button
                onClick={() => navigate('/parties/new')}
                style={{
                    background: '#007bff',
                    color: '#fff',
                    border: 'none',
                    padding: '0.6rem 1.2rem',
                    borderRadius: '6px',
                    fontWeight: 'bold',
                    cursor: 'pointer',
                }}
            >
                + Add Party
            </button>

            <h1>Party list</h1>

            <form onSubmit={handleSubmit} style={{ marginBottom: '20px' }}>
                <input
                    type="text"
                    value={username}
                    placeholder="Username"
                    onChange={e => setUsername(e.target.value)}
                    style={{ padding: '8px', fontSize: '16px', width: '250px' }}
                />
                <button
                    type="submit"
                    style={{
                        marginLeft: '10px',
                        padding: '8px 12px',
                        fontSize: '16px',
                        cursor: 'pointer'
                    }}
                    disabled={loading}
                >
                    {loading ? 'Loading...' : 'Show'}
                </button>
            </form>

            {error && (
                <div style={{ color: 'red', marginBottom: '20px' }}>
                    {error}
                </div>
            )}

            {parties.length > 0 && (
                <ul style={{ listStyle: 'none', padding: 0 }}>
                    {parties.map(party => (
                        <li
                            key={party.matchId}
                            style={{
                                marginBottom: '12px',
                                border: '1px solid #ccc',
                                borderRadius: '4px',
                                padding: '12px',
                                transition: 'background 0.2s'
                            }}
                        >
                            <Link
                                to={`/parties/${party.matchId}`}
                                style={{
                                    textDecoration: 'none',
                                    color: 'inherit',
                                    display: 'block'
                                }}
                            >
                                <div>
                                    <strong>ID:</strong> {party.matchId}
                                </div>

                                {party.users.map((u, i) => (
                                    <div key={i} className="list-item">
                                        <div className="detail-group">
                                            <span className="detail-label">Username</span>
                                            <span className="detail-value">{u.username}</span>
                                        </div>
                                        <div className="detail-group">
                                            <span className="detail-label">Character</span>
                                            <span className="detail-value">{u.character}</span>
                                        </div>
                                    </div>
                                ))}

                                {party.teams.map((t, i) => (
                                    <div key={i} className="list-item">
                                        <div className="detail-group">
                                            <span className="detail-label">Team</span>
                                            <span className="detail-value">{t.name}</span>
                                        </div>
                                    </div>
                                ))}

                                <div>
                                    <strong>Winner:</strong> {party.winner}
                                </div>
                                <div>
                                    <strong>Date:</strong> {new Date(party.date).toLocaleString()}
                                </div>
                            </Link>
                        </li>
                    ))}
                </ul>
            )}

            {!loading && parties.length === 0 && !error && (
                <p>List of games will be here after entering the username.</p>
            )}
        </div>
    );
}
