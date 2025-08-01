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
                <table style={{width: '100%', borderCollapse: 'collapse', marginTop: '16px'}}>
                    <thead>
                    <tr style={{background: '#f0f0f0'}}>
                        <th
                            onClick={() => loadData('name')}
                            style={{padding: '8px', textAlign: 'left', cursor: 'pointer'}}
                        >
                            Name{sortBy === 'name' && (direction === 'asc' ? ' ▲' : ' ▼')}
                        </th>
                        <th
                            onClick={() => loadData('count')}
                            style={{padding: '8px', textAlign: 'left', cursor: 'pointer'}}
                        >
                            Count{sortBy === 'count' && (direction === 'asc' ? ' ▲' : ' ▼')}
                        </th>
                        <th
                            onClick={() => loadData('hp')}
                            style={{padding: '8px', textAlign: 'left', cursor: 'pointer'}}
                        >
                            HP{sortBy === 'hp' && (direction === 'asc' ? ' ▲' : ' ▼')}
                        </th>
                        <th
                            onClick={() => loadData('move')}
                            style={{padding: '8px', textAlign: 'left', cursor: 'pointer'}}
                        >
                            Move{sortBy === 'move' && (direction === 'asc' ? ' ▲' : ' ▼')}
                        </th>
                        <th
                            onClick={() => loadData('attackType')}
                            style={{padding: '8px', textAlign: 'left', cursor: 'pointer'}}
                        >
                            Attack{sortBy === 'attackType' && (direction === 'asc' ? ' ▲' : ' ▼')}
                        </th>
                        <th style={{padding: '8px', textAlign: 'left'}}>Sidekick</th>
                    </tr>
                    </thead>
                    <tbody>
                    {characters.map((ch, idx) => (
                        <tr key={`${ch.name}-${idx}`}>
                            <td style={{padding: '8px'}}>
                                <Link
                                    to={`/characters/${encodeURIComponent(ch.name)}`}
                                    style={{textDecoration: 'none', color: '#333'}}
                                >
                                    {ch.name}
                                </Link>
                            </td>
                            <td style={{padding: '8px'}}>
                                {ch.count > 1 && <span>x{ch.count}</span>}
                            </td>
                            <td style={{padding: '8px'}}>{ch.hp}</td>
                            <td style={{padding: '8px'}}>{ch.move}</td>
                            <td style={{padding: '8px'}}>
                                <img
                                    src={`/attack_type/${attackTypeLabel(ch.attackType)}.png`}
                                    alt={attackTypeLabel(ch.attackType)}
                                    width={108}
                                    height={27}
                                />
                            </td>
                            <td style={{padding: '8px'}}>{ch.sidekick?.name ?? ''}</td>
                        </tr>
                    ))}
                    </tbody>
                </table>
            )}
        </div>
    );
}
