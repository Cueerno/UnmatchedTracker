import React, { useEffect, useState } from 'react';
import { getTopByWins } from '../../api/character';

interface CharacterTopItem {
    rating: number;
    name: string;
    win_count: number;
}

export function CharactersTop() {
    const [list, setList] = useState<CharacterTopItem[]>([]);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState<string | null>(null);

    useEffect(() => {
        setLoading(true);
        getTopByWins()
            .then(data => setList(data))
            .catch(err => setError(err.message || 'Loading error'))
            .finally(() => setLoading(false));
    }, []);

    return (
        <div style={{ padding: '20px' }}>
            <h1>Character Ranking by Wins</h1>

            {loading && <p> Loading...</p>}
            {error && <p style={{ color: 'red' }}>{error}</p>}

            {list.length > 0 && (
                <table style={{ width: '100%', borderCollapse: 'collapse', marginTop: '16px' }}>
                    <thead>
                    <tr style={{ background: '#f0f0f0' }}>
                        <th style={{ padding: '8px', textAlign: 'left' }}>#</th>
                        <th style={{ padding: '8px', textAlign: 'left' }}>Character</th>
                        <th style={{ padding: '8px', textAlign: 'left' }}>Wins</th>
                    </tr>
                    </thead>
                    <tbody>
                    {list.map(item => (
                        <tr key={item.rating}>
                            <td style={{ padding: '8px' }}>{item.rating}</td>
                            <td style={{ padding: '8px' }}>{item.name}</td>
                            <td style={{ padding: '8px' }}>{item.win_count}</td>
                        </tr>
                    ))}
                    </tbody>
                </table>
            )}

            {!loading && list.length === 0 && !error && (
                <p>No data.</p>
            )}
        </div>
    );
}
