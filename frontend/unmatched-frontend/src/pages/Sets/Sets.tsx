import React, {useEffect, useState} from 'react';
import {Link} from 'react-router-dom';
import {getAll} from '../../api/set';
import {SetDto} from '../../types/set';

export function Sets() {
    const [sets, setSets] = useState<SetDto[]>([]);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState<string | null>(null);

    const [sortBy, setSortBy] = useState<string>('name');
    const [direction, setDirection] = useState<'asc' | 'desc'>('asc');

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
            .then(data => setSets(data))
            .catch(err => setError(err.message || 'Loading error'))
            .finally(() => setLoading(false));
    };

    useEffect(() => {
        loadData('releaseDate', 'asc');
    }, []);

    const formatMonthYear = (iso: string) =>
        new Date(iso).toLocaleDateString('en-EN', {
            month: 'long',
            year: 'numeric',
        });

    return (
        <div style={{padding: '20px'}}>
            <h1>List of Sets</h1>

            {loading && <p>Loading...</p>}
            {error && <p style={{color: 'red'}}>{error}</p>}
            {!loading && !error && sets.length === 0 && <p>No sets available.</p>}

            {sets.length > 0 && (
                <table
                    style={{
                        width: '100%',
                        borderCollapse: 'collapse',
                        marginTop: '16px',
                    }}
                >
                    <thead>
                    <tr style={{background: '#f0f0f0'}}>
                        <th
                            onClick={() => loadData('name')}
                            style={{padding: '8px', textAlign: 'left', cursor: 'pointer'}}
                        >
                            Name{sortBy === 'name' && (direction === 'asc' ? ' ▲' : ' ▼')}
                        </th>
                        <th style={{padding: '8px', textAlign: 'left'}}>
                            Characters
                        </th>
                        <th style={{padding: '8px', textAlign: 'left'}}>
                            Boards
                        </th>
                        <th
                            onClick={() => loadData('releaseDate')}
                            style={{padding: '8px', textAlign: 'left', cursor: 'pointer'}}
                        >
                            Release Date
                            {sortBy === 'releaseDate' && (direction === 'asc' ? ' ▲' : ' ▼')}
                        </th>
                    </tr>
                    </thead>

                    <tbody>
                    {sets.map((set, idx) => {
                        const mainRow = (
                            <tr key={`main-${idx}`}>
                                <td
                                    style={{
                                        padding: '8px',
                                        borderBottom: set.description
                                            ? 'none'
                                            : '1px solid #ccc',
                                    }}
                                >
                                    <Link
                                        to={`/sets/${encodeURIComponent(set.name)}`}
                                        style={{textDecoration: 'none', color: '#333'}}
                                    >
                                        {set.name}
                                    </Link>
                                </td>
                                <td
                                    style={{
                                        padding: '8px',
                                        borderBottom: set.description ? 'none' : '1px solid #ccc',
                                        verticalAlign: 'top',
                                    }}
                                >
                                    {set.characters.map((ch, idx) => (
                                        <span key={ch.name + idx}>
                                            <Link
                                                to={`/characters/${encodeURIComponent(ch.name)}`}
                                                style={{textDecoration: 'none', color: '#007bff'}}
                                            >
                                                {ch.name}
                                            </Link>
                                            {idx < set.characters.length - 1 && ', '}
                                        </span>
                                    ))}
                                </td>
                                <td
                                    style={{
                                        padding: '8px',
                                        borderBottom: set.description
                                            ? 'none'
                                            : '1px solid #ccc',
                                    }}
                                >
                                    {set.boards.map(b => b.name).join(', ')}
                                </td>
                                <td
                                    style={{
                                        padding: '8px',
                                        borderBottom: set.description
                                            ? 'none'
                                            : '1px solid #ccc',
                                    }}
                                >
                                    {formatMonthYear(set.releaseDate)}
                                </td>
                            </tr>
                        );

                        const descRow = set.description && (
                            <tr key={`desc-${idx}`}>
                                <td
                                    colSpan={4}
                                    style={{
                                        padding: '8px',
                                        borderTop: 'none',
                                        borderBottom: '1px solid #ccc',
                                    }}
                                >
                                    {set.description}
                                </td>
                            </tr>
                        );

                        return descRow ? [mainRow, descRow] : [mainRow];
                    })}
                    </tbody>
                </table>
            )}
        </div>
    );
}
