import React, {useEffect, useRef, useState} from 'react';
import {getAll} from '../../api/board';
import {BoardDto} from '../../types/board';

export function Boards() {
    const [boards, setBoards] = useState<BoardDto[]>([]);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState<string | null>(null);

    const [sortBy, setSortBy] = useState<string>('');
    const [direction, setDirection] = useState<'asc' | 'desc' | ''>('');

    const didFetchOnce = useRef(false);

    const loadData = (field?: string, dirOverride?: 'asc' | 'desc'
    ) => {
        let paramsField = '';
        let paramsDir = '';

        if (field) {
            const newDir =
                dirOverride ??
                (field === sortBy
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
            .then(data => setBoards(data))
            .catch(err => setError(err.message || 'Loading error'))
            .finally(() => setLoading(false));
    };

    useEffect(() => {
        if (!didFetchOnce.current) {
            didFetchOnce.current = true;
            loadData();
        }
    }, []);

    const renderArrow = (field: string) => {
        if (sortBy !== field) return null;
        return direction === 'asc' ? ' ▲' : ' ▼';
    };

    return (
        <div style={{padding: 20}}>
            <h1>List of Boards</h1>

            {loading && <p>Loading...</p>}
            {error && <p style={{color: 'red'}}>{error}</p>}
            {!loading && !error && boards.length === 0 && <p>No boards available.</p>}

            {boards.length > 0 && (
                <table
                    style={{
                        width: '100%',
                        borderCollapse: 'collapse',
                        marginTop: 16,
                    }}
                >
                    <thead>
                    <tr style={{background: '#f0f0f0'}}>
                        <th style={{padding: 8, textAlign: 'left'}}>Image</th>

                        <th
                            onClick={() => loadData('name')}
                            style={{
                                padding: 8,
                                textAlign: 'left',
                                cursor: 'pointer',
                            }}
                        >
                            Name{renderArrow('name')}
                        </th>

                        <th
                            onClick={() => loadData('maxPlayers')}
                            style={{
                                padding: 8,
                                textAlign: 'left',
                                cursor: 'pointer',
                            }}
                        >
                            Max. players{renderArrow('maxPlayers')}
                        </th>

                        <th
                            onClick={() => loadData('spaces')}
                            style={{
                                padding: 8,
                                textAlign: 'left',
                                cursor: 'pointer',
                            }}
                        >
                            Spaces{renderArrow('spaces')}
                        </th>

                        <th
                            onClick={() => loadData('zones')}
                            style={{
                                padding: 8,
                                textAlign: 'left',
                                cursor: 'pointer',
                            }}
                        >
                            Zones{renderArrow('zones')}
                        </th>

                        <th style={{padding: 8, textAlign: 'left'}}>Feature</th>
                    </tr>
                    </thead>

                    <tbody>
                    {boards.map((b, idx) => (
                        <tr key={`${b.name}-${idx}`}>
                            <td
                                style={{
                                    padding: 8,
                                    borderBottom: '1px solid #ccc',
                                }}
                            >
                                {b.imageUrl && (
                                    <img
                                        src={b.imageUrl}
                                        alt={b.name}
                                        style={{
                                            width: 260,
                                            height: 162.5,
                                            objectFit: 'cover',
                                        }}
                                    />
                                )}
                            </td>

                            <td
                                style={{
                                    padding: 8,
                                    borderBottom: '1px solid #ccc',
                                }}
                            >
                                {b.name}
                            </td>

                            <td
                                style={{
                                    padding: 8,
                                    borderBottom: '1px solid #ccc',
                                }}
                            >
                                {b.maxPlayers}
                            </td>

                            <td
                                style={{
                                    padding: 8,
                                    borderBottom: '1px solid #ccc',
                                }}
                            >
                                {b.spaces}
                            </td>

                            <td
                                style={{
                                    padding: 8,
                                    borderBottom: '1px solid #ccc',
                                }}
                            >
                                {b.zones}
                            </td>

                            <td
                                style={{
                                    padding: 8,
                                    borderBottom: '1px solid #ccc',
                                }}
                            >
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
