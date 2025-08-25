import './DashboardStats.css'

export default function DashboardStats({ dashboard }: { dashboard: {
        numberOfUsers: number;
        numberOfParties: number;
        numberOfSets: number;
        numberOfDecks: number;
    } }) {
    const stats = [
        { key: 'users', value: dashboard.numberOfUsers ?? 0, label: 'Users', hint: 'Registered users' },
        { key: 'partes', value: dashboard.numberOfParties ?? 0, label: 'Parties', hint: 'Games played' },
        { key: 'sets', value: dashboard.numberOfSets ?? 0, label: 'Sets', hint: 'Available sets' },
        { key: 'decks', value: dashboard.numberOfDecks ?? 0, label: 'Decks', hint: 'Saved decks' },
    ];

    return (
        <div className="dashboard-stats" role="group" aria-label="Platform statistics">
            {stats.map(s => (
                <div key={s.key} className="stat-card" role="listitem" tabIndex={0} aria-label={`${s.label}: ${s.value}`}>
                    <div className="stat-icon" aria-hidden>
                        {/* простая SVG-иконка (подставь свои, если хочешь) */}
                        {s.key === 'users' && (
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M12 12a4 4 0 1 0 0-8 4 4 0 0 0 0 8z" stroke="white" strokeWidth="1.2" strokeLinecap="round" strokeLinejoin="round"/>
                                <path d="M4 20a8 8 0 0 1 16 0" stroke="white" strokeWidth="1.2" strokeLinecap="round" strokeLinejoin="round"/>
                            </svg>
                        )}
                        {s.key === 'partes' && (
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M3 7h18M3 12h18M3 17h18" stroke="white" strokeWidth="1.2" strokeLinecap="round"/>
                            </svg>
                        )}
                        {s.key === 'sets' && (
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <rect x="3" y="3" width="7" height="7" rx="1" stroke="white" strokeWidth="1.2"/>
                                <rect x="14" y="3" width="7" height="7" rx="1" stroke="white" strokeWidth="1.2"/>
                                <rect x="3" y="14" width="7" height="7" rx="1" stroke="white" strokeWidth="1.2"/>
                                <rect x="14" y="14" width="7" height="7" rx="1" stroke="white" strokeWidth="1.2"/>
                            </svg>
                        )}
                        {s.key === 'decks' && (
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M3 7h18v11a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V7z" stroke="white" strokeWidth="1.2" strokeLinecap="round" strokeLinejoin="round"/>
                                <path d="M7 3h10v4H7z" stroke="white" strokeWidth="1.2" strokeLinecap="round" strokeLinejoin="round"/>
                            </svg>
                        )}
                    </div>

                    <div className="stat-body">
                        <div className="stat-value" aria-live="polite">{s.value.toLocaleString()}</div>
                        <div className="stat-label">{s.label}</div>
                        <div className="stat-hint">{s.hint}</div>
                    </div>
                </div>
            ))}
        </div>
    );
}
