import React, {useState, useEffect} from 'react';
import {useParams, useNavigate} from 'react-router-dom';
import {getPartyByMatchId} from '../../api/party';
import './Party.css';
import {PartyPayload} from "../../types/party";

export const Party: React.FC = () => {
    const {matchId} = useParams<{ matchId: string }>();
    const navigate = useNavigate();

    const [party, setParty] = useState<PartyPayload | null>(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);

    useEffect(() => {
        if (!matchId) return;

        setLoading(true);
        getPartyByMatchId(parseInt(matchId, 10))
            .then(data => {
                setParty(data);
                setError(null);
            })
            .catch(err => setError(err.message))
            .finally(() => setLoading(false));
    }, [matchId]);

    if (loading) {
        return (
            <div className="party-page">
                <p>Loading...</p>
            </div>
        );
    }

    if (error) {
        return (
            <div className="party-page">
                <p className="error-text">{error}</p>
            </div>
        );
    }

    if (!party) return null;

    return (
        <div className="party-page">
            <h1 className="page-title">Party Details</h1>

            <div className="detail-section">
                <div className="detail-group">
                    <span className="detail-label">Format</span>
                    <span className="detail-value">{party.format}</span>
                </div>
                <div className="detail-group">
                    <span className="detail-label">Date</span>
                    <span className="detail-value">
                        {new Date(party.date).toLocaleString()}
                    </span>
                </div>
                <div className="detail-group">
                    <span className="detail-label">Board</span>
                    <span className="detail-value">{party.boardName}</span>
                </div>
                <div className="detail-group">
                    <span className="detail-label">Winner</span>
                    <span className="detail-value">{party.winner}</span>
                </div>
            </div>

            <div className="detail-section">
                <h2 className="section-title">Players</h2>
                <div className="list">
                    {party.users.map((u, i) => (
                        <div key={i} className="list-item">
                            <div className="detail-group">
                                <span className="detail-label">Username</span>
                                <span className="detail-value">{u.username}</span>
                            </div>
                            <div className="detail-group">
                                <span className="detail-label">Character</span>
                                <span className="detail-value">{u.character}</span>
                            </div>
                            <div className="detail-group">
                                <span className="detail-label">Move Order</span>
                                <span className="detail-value">{u.moveOrder}</span>
                            </div>
                            <div className="detail-group">
                                <span className="detail-label">Final HP</span>
                                <span className="detail-value">{u.finalHp}</span>
                            </div>
                        </div>
                    ))}
                </div>
            </div>

            {party.format === 'TEAMS' && (
                <div className="detail-section">
                    <h2 className="section-title">Teams</h2>
                    <div className="list">
                        {party.teams.map((t, i) => (
                            <div key={i} className="list-item">
                                <div className="detail-group">
                                    <span className="detail-label">Team</span>
                                    <span className="detail-value">{t.name}</span>
                                </div>
                            </div>
                        ))}
                    </div>
                </div>
            )}

            <button
                className="secondary-button"
                onClick={() => navigate('/parties')}
            >
                Back
            </button>
        </div>
    );
};
