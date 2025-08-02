import React, {useEffect, useRef, useState} from 'react';
import {getAll} from '../../api/character';
import {Link, useNavigate} from 'react-router-dom';
import {AttackType, CharacterDto} from '../../types/character';

export function Characters() {
    const [characters, setCharacters] = useState<CharacterDto[]>([]);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState<string | null>(null);

    const [sortBy, setSortBy] = useState<string>('');
    const [direction, setDirection] = useState<'asc' | 'desc' | ''>('');

    const didFetchOnce = useRef(false);
    const navigate = useNavigate();

    const loadData = (field?: string, dirOverride?: 'asc' | 'desc') => {
        let paramsField = '';
        let paramsDir = '';

        if (field) {
            const newDir = dirOverride
                ?? (field === sortBy
                    ? (direction === 'asc' ? 'desc' : 'asc')
                    : 'asc');

            setSortBy(field);
            setDirection(newDir);

            paramsField = field;
            paramsDir = newDir;
        } else {
            setSortBy('');
            setDirection('');
        }

        setLoading(true);
        setError(null);

        getAll(paramsField || undefined, paramsDir || undefined)
            .then(setCharacters)
            .catch(err => setError(err.message || 'Loading error'))
            .finally(() => setLoading(false));
    };

    useEffect(() => {
        if (!didFetchOnce.current) {
            didFetchOnce.current = true;
            loadData();
        }
    }, []);

    const attackTypeLabel = (t: AttackType) => t.toLowerCase();
    const renderArrow = (field: string) => sortBy === field
        ? (direction === 'asc' ? ' ▲' : ' ▼')
        : null;

    return (
        <div style={{padding: 20}}>
            <h1>List of playable characters</h1>

            <button
                style={{
                    marginBottom: 20, padding: '10px 16px',
                    backgroundColor: '#007bff', color: '#fff',
                    border: 'none', borderRadius: 4,
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
                <table style={{width: '100%', borderCollapse: 'collapse', marginTop: 16}}>
                    <thead>
                    <tr style={{background: '#f0f0f0'}}>
                        {['name', 'count', 'hp', 'move', 'attackType'].map(col => (
                            <th
                                key={col}
                                onClick={() => loadData(col)}
                                style={{padding: 8, textAlign: 'left', cursor: 'pointer'}}
                            >
                                {col === 'attackType' ? 'Attack' : col.charAt(0).toUpperCase() + col.slice(1)}
                                {renderArrow(col)}
                            </th>
                        ))}
                        <th style={{padding: 8, textAlign: 'left'}}>Sidekick</th>
                    </tr>
                    </thead>
                    <tbody>
                    {characters.map((ch, i) => (
                        <tr key={`${ch.name}-${i}`}>
                            <td style={{padding: 8}}>
                                <Link
                                    to={`/characters/${encodeURIComponent(ch.name)}`}
                                    style={{textDecoration: 'none', color: '#333'}}
                                >
                                    {ch.name}
                                </Link>
                            </td>
                            <td style={{padding: 8}}>
                                {ch.count > 1 && <span>x{ch.count}</span>}
                            </td>
                            <td style={{padding: 8}}>{ch.hp}</td>
                            <td style={{padding: 8}}>{ch.move}</td>
                            <td style={{padding: 8}}>
                                <img
                                    src={`/attack_type/${attackTypeLabel(ch.attackType)}.png`}
                                    alt={attackTypeLabel(ch.attackType)}
                                    width={108}
                                    height={27}
                                />
                            </td>
                            <td style={{padding: 8}}>
                                {ch.sidekick?.name || ''}
                            </td>
                        </tr>
                    ))}
                    </tbody>
                </table>
            )}
        </div>
    );
}
