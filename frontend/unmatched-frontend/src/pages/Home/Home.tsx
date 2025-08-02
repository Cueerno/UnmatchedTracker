import React from 'react';

export function Home() {
    return (
        <div
            style={{
                padding: '40px',
                minHeight: 'calc(100vh - 80px)',
                background: 'linear-gradient(to right, #e9f5ff, #fdfcff)',
                fontFamily: 'Segoe UI, sans-serif',
            }}
        >
            <h1 style={{ fontSize: '2.5rem', color: '#333' }}>
                🎲 Welcome to Unmatched Tracker
            </h1>

            <p style={{ margin: '16px 0', fontSize: '1.2rem', color: '#555' }}>
                Dive into the world of legends, mythical battles, and heroic duels. Browse characters,
                explore boards, and track your favorite sets.
            </p>

            <div
                style={{
                    display: 'flex',
                    gap: '24px',
                    marginTop: '32px',
                    flexWrap: 'wrap',
                }}
            >
            </div>
        </div>
    );
}
