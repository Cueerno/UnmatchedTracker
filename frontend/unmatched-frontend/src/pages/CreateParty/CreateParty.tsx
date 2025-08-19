import React, {FormEvent, useEffect, useState} from 'react';
import {Link, useNavigate} from 'react-router-dom';
import {createParty} from '../../api/party';
import {getNames as getBoardNames} from '../../api/board';
import {getNames as getDecksNames} from '../../api/deck';
import './CreateParty.css';
import {AutocompleteInput} from "../../components/AutocompleteInput/AutocompleteInput";

type PartyType = 'HEADS_UP' | 'TEAMS' | 'FREE_FOR_ALL';

interface Player {
    name: string;
    deck: string;
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
                    {name: '', deck: '', moveOrder: 1, finalHp: ''},
                    {name: '', deck: '', moveOrder: 2, finalHp: ''},
                ]);
                setTeams([{team: ''}, {team: ''}]);
                break;
            case 'TEAMS':
                setPlayers([
                    {name: '', deck: '', moveOrder: 1, finalHp: ''},
                    {name: '', deck: '', moveOrder: 2, finalHp: ''},
                    {name: '', deck: '', moveOrder: 3, finalHp: ''},
                    {name: '', deck: '', moveOrder: 4, finalHp: ''},
                ]);
                setTeams([{team: ''}, {team: ''}]);
                break;
            case 'FREE_FOR_ALL':
                setPlayers([
                    {name: '', deck: '', moveOrder: 1, finalHp: ''},
                    {name: '', deck: '', moveOrder: 2, finalHp: ''},
                    {name: '', deck: '', moveOrder: 3, finalHp: ''},
                ]);
                setTeams([
                    {team: ''},
                    {team: ''},
                    {team: ''},
                ]);
                break;
        }
        setWinner('');
    }, [partyType]);

    const isFormValid = React.useMemo(() => {
        if (!boardName.trim()) {
            return false;
        }

        for (const p of players) {
            if (!p.name.trim() || !p.deck.trim() || !p.finalHp.trim()) {
                return false;
            }
        }

        if (partyType === 'TEAMS') {
            for (const t of teams) {
                if (!t.team.trim()) {
                    return false;
                }
            }
        }

        return winner.trim();
    }, [boardName, players, teams, winner, partyType]);

    const updatePlayer = (
        idx: number,
        field: keyof Omit<Player, 'moveOrder'>,
        value: string,
    ) => {
        const nextPlayers = [...players]
        nextPlayers[idx][field] = value

        const nextTeams = [...teams]

        if (field === 'name' && partyType === 'TEAMS') {
            const [p0, p1, p2, p3] = nextPlayers
            const makeLabel = (a: string, b: string) => {
                if (!a || !b) return ''
                return a === b ? a : `${a} & ${b}`
            }

            nextTeams[0].team = makeLabel(p0.name.trim(), p2.name.trim())
            nextTeams[1].team = makeLabel(p1.name.trim(), p3.name.trim())
        }
        setPlayers(nextPlayers);
        setTeams(nextTeams)
    };

    const addFfaPlayer = () => {
        setPlayers(p => [
            ...p,
            {name: '', deck: '', moveOrder: p.length + 1, finalHp: ''},
        ]);
        setTeams(t => [...t, {team: ''}]);
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
                deck: p.deck,
                moveOrder: p.moveOrder,
                finalHp: Number(p.finalHp),
            })),
            teams: partyType === 'TEAMS'
                ? teams.map(t => ({name: t.team}))
                : players.map(p => ({name: p.name})),
            winner: winner,
        };
        try {
            const result = await createParty(payload);
            console.log('Party created:', result);
            navigate('/parties', {replace: true})
        } catch (err: any) {
            setError(err.message);
        } finally {
            setLoading(false);
        }
    };

    const winnerOptions =
        partyType === 'TEAMS'
            ? teams.map((t, i) => ({value: t.team, label: t.team || `Team ${i + 1}`}))
            : players.map((p, i) => ({
                value: p.name,
                label: p.name || `Player ${i + 1}`,
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
                        <AutocompleteInput
                            value={boardName}
                            onChange={setBoardName}
                            fetchOptions={getBoardNames}
                            placeholder="Enter board name"
                        />
                    </div>
                </div>

                <div className="form-section">
                    <h2 className="section-title">Players (add according to the order of moves in the game)</h2>
                    <p className="note">(Please make sure the player is already registered) if not - <Link
                        to={"/user/create"}>create</Link></p>
                    <div className="players-list">
                        {players.map((p, idx) => (
                            <div key={idx} className="player-item">
                                <h3 className="player-title">Player {idx + 1}</h3>
                                {(['name', 'deck', 'finalHp'] as const).map(field => (
                                    <div className="form-group" key={field}>
                                        <label className="form-label">
                                            {field === 'finalHp' ? 'Final HP' : field === 'name' ? 'Username' : 'Deck'}
                                        </label>
                                        {field === 'deck' ? (
                                            <AutocompleteInput
                                                value={p.deck}
                                                onChange={val => updatePlayer(idx, 'deck', val)}
                                                fetchOptions={getDecksNames}
                                                placeholder={"Enter deck name"}
                                            />
                                        ) : (
                                            <input
                                                className="form-input"
                                                type="text"
                                                placeholder={
                                                    field === 'name'
                                                        ? 'Enter username'
                                                        : 'Enter final HP'
                                                }
                                                value={p[field]}
                                                onChange={e => updatePlayer(idx, field, e.target.value)}
                                            />
                                        )}
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
                                    <div className="team-name">{t.team}</div>
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
                            {winnerOptions.map(({value, label}, i) => (
                                <option key={i} value={value}>
                                    {label}
                                </option>
                            ))}
                        </select>
                    </div>
                </div>

                <div className="form-section">
                    <button
                        type="submit"
                        className="primary-button"
                        disabled={isLoading || !isFormValid}>
                        {isLoading ? 'Saving...' : 'Save'}
                    </button>
                    {error && <p className="error-text">{error}</p>}
                </div>
            </form>
        </div>
    );
};
