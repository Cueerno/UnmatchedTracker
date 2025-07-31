import React, {useEffect, useState} from 'react';
import {getAll} from '../../api/character';
import {Link, useNavigate} from 'react-router-dom';
import {AttackType, CharacterDto} from '../../types/character';

export function Characters() {
    const [characters, setCharacters] = useState<CharacterDto[]>([]);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState<string | null>(null);
    const [sortBy, setSortBy] = useState<string>('name');
    const [direction, setDirection] = useState<'asc' | 'desc'>('asc');
    const navigate = useNavigate();

    const loadData = (field: string, dirOverride?: 'asc' | 'desc') => {
        const newDir =
            dirOverride ??
            (field === sortBy
                ? direction === 'asc'
                    ? 'desc'
                    : 'asc'
                : 'asc');

        setSortBy(field);
        setDirection(newDir);
        setLoading(true);
        setError(null);

        getAll(field, newDir)
            .then(data => setCharacters(data))
            .catch(err => setError(err.message || 'Loading error'))
            .finally(() => setLoading(false));
    };

    useEffect(() => {
        loadData('name', 'asc');
    }, []);

    const attackTypeLabel = (type: AttackType) => type.toLowerCase();

    return (
        <div style={{padding: '20px'}}>
            <h1>List of playable characters</h1>

            <div style={{marginBottom: '16px'}}>
                Sort by:
                {['name', 'hp', 'move', 'attackType'].map(field => (
                    <button
                        key={field}
                        onClick={() => loadData(field)}
                        style={{margin: '0 8px', cursor: 'pointer'}}
                    >
                        {field.charAt(0).toUpperCase() + field.slice(1)}
                        {sortBy === field && (direction === 'asc' ? ' ▲' : ' ▼')}
                    </button>
                ))}
            </div>

            <button
                style={{
                    marginBottom: '20px',
                    padding: '10px 16px',
                    backgroundColor: '#007bff',
                    color: '#fff',
                    border: 'none',
                    borderRadius: '4px',
                    cursor: 'pointer',
                }}
                onClick={() => navigate('/characters/top')}
            >
                Characters top
            </button>

            {loading && <p>Loading...</p>}
            {error && <p style={{color: 'red'}}>{error}</p>}
            {!loading && !error && characters.length === 0 && (
                <p>No characters available.</p>
            )}

            {characters.length > 0 && (
                <ul style={{listStyle: 'none', padding: 0}}>
                    {characters.map((ch, idx) => (
                        <li
                            key={`${ch.name}-${idx}`}
                            style={{
                                padding: '8px',
                                marginBottom: '6px',
                                backgroundColor: '#f8f8f8',
                                border: '1px solid #ccc',
                                borderRadius: '4px',
                            }}
                        >
                            <Link
                                to={`/characters/${encodeURIComponent(ch.name)}`}
                                style={{textDecoration: 'none', color: '#333'}}
                            >
                                <div style={{display: 'flex', alignItems: 'center', gap: '8px'}}>
                                    <span>
                                        {ch.name} | HP: {ch.hp} | Move: {ch.move}
                                    </span>
                                    <img
                                        src={`/attack_type/${attackTypeLabel(ch.attackType)}.png`}
                                        alt={attackTypeLabel(ch.attackType)}
                                        width={108}
                                        height={27}
                                    />
                                </div>
                                {ch.sidekick && (
                                    <div style={{marginTop: '4px'}}>
                                        Sidekick: {ch.sidekick.name}
                                    </div>
                                )}
                            </Link>
                        </li>
                    ))}
                </ul>
            )}
        </div>
    );
}
