import React, { useState, useEffect, FormEvent } from 'react';
import { useNavigate } from 'react-router-dom';
import { createParty } from '../../api/party';
import './CreateParty.css';

type PartyType = 'HEADS_UP' | 'TEAMS' | 'FREE_FOR_ALL';

interface Player {
    name: string;
    character: string;
    moveOrder: number;
    finalHp: string;
}

interface Team {
    team: string;
}

export const CreateParty: React.FC = () => {
    const [partyType, setPartyType] = useState<PartyType>('HEADS_UP');
    const [players, setPlayers] = useState<Player[]>([]);
    const [teams, setTeams] = useState<Team[]>([]);
    const [winner, setWinner] = useState<string>('');
    const [boardName, setBoardName] = useState('');
    const [dateTime, setDateTime] = useState<string>(
        () => new Date().toISOString().slice(0, 19),
    );
    const [isLoading, setLoading] = useState(false);
    const [error, setError] = useState<string | null>(null);
    const navigate = useNavigate();

    useEffect(() => {
        switch (partyType) {
            case 'HEADS_UP':
                setPlayers([
                    { name: '', character: '', moveOrder: 1, finalHp: '' },
                    { name: '', character: '', moveOrder: 2, finalHp: '' },
                ]);
                setTeams([{ team: '' }, { team: '' }]);
                break;
            case 'TEAMS':
                setPlayers([
                    { name: '', character: '', moveOrder: 1, finalHp: '' },
                    { name: '', character: '', moveOrder: 2, finalHp: '' },
                    { name: '', character: '', moveOrder: 3, finalHp: '' },
                    { name: '', character: '', moveOrder: 4, finalHp: '' },
                ]);
                setTeams([{ team: '' }, { team: '' }]);
                break;
            case 'FREE_FOR_ALL':
                setPlayers([
                    { name: '', character: '', moveOrder: 1, finalHp: '' },
                    { name: '', character: '', moveOrder: 2, finalHp: '' },
                    { name: '', character: '', moveOrder: 3, finalHp: '' },
                ]);
                setTeams([
                    { team: '' },
                    { team: '' },
                    { team: '' },
                ]);
                break;
        }
        setWinner('');
    }, [partyType]);

    const updatePlayer = (
        idx: number,
        field: keyof Omit<Player, 'moveOrder'>,
        value: string,
    ) => {
        const nextPlayers = [...players];

        nextPlayers[idx][field] = value;

        const nextTeams = [...teams];

        if (field === 'name') {
            if (partyType !== 'TEAMS') {
                nextTeams[idx].team = value;
            }
            else {
                const [p0, p1, p2, p3] = nextPlayers;
                nextTeams[0].team = p0.name && p1.name ? `${p0.name} & ${p2.name}` : '';
                nextTeams[1].team = p2.name && p3.name ? `${p1.name} & ${p3.name}` : '';
            }
        }
        setPlayers(nextPlayers);
        setTeams(nextTeams)
    };

    const addFfaPlayer = () => {
        setPlayers(p => [
            ...p,
            { name: '', character: '', moveOrder: p.length + 1, finalHp: '' },
        ]);
        setTeams(t => [...t, { team: '' }]);
    };

    const removeFfaPlayer = () => {
        if (players.length > 3) {
            setPlayers(p => p.slice(0, -1));
            setTeams(t => t.slice(0, -1));
        }
    };

    const handleSubmit = async (e: FormEvent) => {
        e.preventDefault();
        setLoading(true);
        setError(null);

        const payload = {
            format: partyType,
            date: new Date(dateTime).toISOString(),
            boardName: boardName,
            users: players.map(p => ({
                username: p.name,
                character: p.character,
                moveOrder: p.moveOrder,
                finalHp: Number(p.finalHp),
            })),
            teams: teams.map(t => ({
                name: t.team
            })),
            winner: winner,
        };
        try {
            const result = await createParty(payload);
            console.log('Party created:', result);
            navigate('/', {replace: true})
        } catch (err: any) {
            setError(err.message);
        } finally {
            setLoading(false);
        }
    };

    const winnerOptions =
        partyType === 'TEAMS'
            ? teams.map((t, i) => ({ value: t.team, label: t.team || `Команда ${i + 1}` }))
            : players.map((p, i) => ({
                value: p.name,
                label: p.name || `Игрок ${i + 1}`,
            }));

    return (
        <div className="create-party">
            <h1 className="page-title">Create new party</h1>
            <form onSubmit={handleSubmit}>
                <div className="form-section">
                    <div className="form-group">
                        <label className="form-label">Party format</label>
                        <select
                            className="form-input"
                            value={partyType}
                            onChange={e => setPartyType(e.target.value as PartyType)}
                        >
                            <option value="HEADS_UP">1v1</option>
                            <option value="TEAMS">2v2</option>
                            <option value="FREE_FOR_ALL">Free for all</option>
                        </select>
                    </div>
                    <div className="form-group">
                        <label className="form-label">Date & Time</label>
                        <input
                            className="form-input"
                            type="datetime-local"
                            value={dateTime}
                            onChange={e => setDateTime(e.target.value)}
                        />
                    </div>
                    <div className="form-group">
                        <label className="form-label">Board name</label>
                        <input
                            className="form-input"
                            type="text"
                            value={boardName}
                            onChange={e => setBoardName(e.target.value)}
                        />
                    </div>
                </div>

                <div className="form-section">
                    <h2 className="section-title">Players (add according to the order of moves in the game)</h2>
                    <div className="players-list">
                        {players.map((p, idx) => (
                            <div key={idx} className="player-item">
                                <h3 className="player-title">Player {idx + 1}</h3>
                                {(['name', 'character', 'finalHp'] as const).map(field => (
                                    <div className="form-group" key={field}>
                                        <label className="form-label">
                                            {field === 'finalHp' ? 'Final HP' : field === 'name' ? 'Username' : 'Character'}
                                        </label>
                                        <input
                                            className="form-input"
                                            type={field === 'finalHp' ? 'text' : 'text'}
                                            value={p[field]}
                                            onChange={e => updatePlayer(idx, field, e.target.value)}
                                        />
                                    </div>
                                ))}
                            </div>
                        ))}
                    </div>
                    {partyType === 'FREE_FOR_ALL' && (
                        <div className="buttons-group">
                            <button type="button" className="secondary-button" onClick={addFfaPlayer}>
                                Add player
                            </button>
                            <button type="button" className="secondary-button" onClick={removeFfaPlayer}>
                                Remove player
                            </button>
                        </div>
                    )}
                </div>

                {partyType === 'TEAMS' && (
                    <div className="form-section">
                        <h2 className="section-title">Teams</h2>
                        <div className="teams-list">
                            {teams.map((t, idx) => (
                                <div key={idx} className="team-item form-group">
                                    <label className="form-label">Team {idx + 1}</label>
                                    <input
                                        className="form-input"
                                        type="text"
                                        value={t.team}
                                        readOnly
                                    />
                                </div>
                            ))}
                        </div>
                    </div>
                )}

                <div className="form-section">
                    <div className="form-group">
                        <label className="form-label">Winner</label>
                        <select
                            className="form-input"
                            value={winner}
                            onChange={e => setWinner(e.target.value)}
                        >
                            <option value="">— select —</option>
                            {winnerOptions.map(({ value, label }, i) => (
                                <option key={i} value={value}>
                                    {label}
                                </option>
                            ))}
                        </select>
                    </div>
                </div>

                <div className="form-section">
                    <button type="submit" className="primary-button" disabled={isLoading}>
                        {isLoading ? 'Saving...' : 'Save'}
                    </button>
                    {error && <p className="error-text">{error}</p>}
                </div>
            </form>
        </div>
    );
};
