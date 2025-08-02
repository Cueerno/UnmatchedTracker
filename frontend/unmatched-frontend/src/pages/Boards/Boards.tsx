import React, { useEffect, useState } from 'react';
import { getAll } from '../../api/board';
import { BoardDto } from '../../types/board';

export function Boards() {
    const [boards, setBoards] = useState<BoardDto[]>([]);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState<string | null>(null);

    const [sortBy, setSortBy]     = useState<string>('name');
    const [direction, setDirection] = useState<'asc' | 'desc'>('asc');

    const loadData = (field: string, dirOverride?: 'asc' | 'desc') => {
        const newDir =
            dirOverride ??
            (field === sortBy
                ? direction === 'asc' ? 'desc' : 'asc'
                : 'asc');

        setSortBy(field);
        setDirection(newDir);
        setLoading(true);
        setError(null);

        getAll(field, newDir)
            .then(data => setBoards(data))
            .catch(err => setError(err.message || 'Loading error'))
            .finally(() => setLoading(false));
    };

    useEffect(() => {
        loadData('name', 'asc');
    }, []);

    return (
        <div style={{ padding: '20px' }}>
            <h1>Boards</h1>

            {loading && <p>Loading...</p>}
            {error   && <p style={{ color: 'red' }}>{error}</p>}
            {!loading && !error && boards.length === 0 && <p>No boards available.</p>}

            {boards.length > 0 && (
                <table
                    style={{
                        width: '100%',
                        borderCollapse: 'collapse',
                        marginTop: '16px',
                    }}
                >
                    <thead>
                    <tr style={{ background: '#f0f0f0' }}>
                        <th style={{ padding: '8px', textAlign: 'left' }}>Image</th>
                        <th
                            onClick={() => loadData('name')}
                            style={{ padding: '8px', textAlign: 'left', cursor: 'pointer' }}
                        >
                            Name{sortBy === 'name' && (direction === 'asc' ? ' ▲' : ' ▼')}
                        </th>

                        <th
                            onClick={() => loadData('maxPlayers')}
                            style={{ padding: '8px', textAlign: 'left', cursor: 'pointer' }}
                        >
                            Max. players{sortBy === 'maxPlayers' && (direction === 'asc' ? ' ▲' : ' ▼')}
                        </th>

                        <th
                            onClick={() => loadData('spaces')}
                            style={{ padding: '8px', textAlign: 'left', cursor: 'pointer' }}
                        >
                            Spaces{sortBy === 'spaces' && (direction === 'asc' ? ' ▲' : ' ▼')}
                        </th>

                        <th
                            onClick={() => loadData('zones')}
                            style={{ padding: '8px', textAlign: 'left', cursor: 'pointer' }}
                        >
                            Zones{sortBy === 'zones' && (direction === 'asc' ? ' ▲' : ' ▼')}
                        </th>

                        <th style={{ padding: '8px', textAlign: 'left' }}>Feature</th>
                    </tr>
                    </thead>

                    <tbody>
                    {boards.map((b, idx) => (
                        <tr key={`${b.name}-${idx}`}>
                            <td style={{ padding: '8px', borderBottom: '1px solid #ccc' }}>
                                {b.imageUrl && (
                                    <img
                                        src={b.imageUrl}
                                        alt={b.name}
                                        style={{
                                            width: '260px',
                                            height: '162.5px' }}
                                    />
                                )}
                            </td>

                            <td style={{ padding: '8px', borderBottom: '1px solid #ccc' }}>
                                {b.name}
                            </td>

                            <td style={{ padding: '8px', borderBottom: '1px solid #ccc' }}>
                                {b.maxPlayers}
                            </td>

                            <td style={{ padding: '8px', borderBottom: '1px solid #ccc' }}>
                                {b.spaces}
                            </td>

                            <td style={{ padding: '8px', borderBottom: '1px solid #ccc' }}>
                                {b.zones}
                            </td>

                            <td style={{ padding: '8px', borderBottom: '1px solid #ccc' }}>
                                {b.feature}
                            </td>
                        </tr>
                    ))}
                    </tbody>
                </table>
            )}
        </div>
    );
}
