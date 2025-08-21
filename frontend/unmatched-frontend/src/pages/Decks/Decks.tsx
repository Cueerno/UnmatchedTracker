import React from 'react';
import {Link} from 'react-router-dom';
import {useClientTable} from '../../hooks/useClientTable/useClientTable';
import {getAll} from '../../api/deck';
import {AttackType, DeckDto} from '../../types/deck';
import './Decks.css';

function attackTypeLabel(type: AttackType) {
    return type.toLowerCase();
}

export default function Decks() {
    const {data: decks = [], loading, error} = useClientTable<DeckDto>(getAll);

    return (
        <div className="decks-page">
            <div className="decks-container">
                <h1 className="decks-title">Decks</h1>

                {loading && <p className="decks-status">Loading decks…</p>}
                {error && <p className="decks-status error">{error}</p>}
                {!loading && !error && decks.length === 0 && (
                    <p className="decks-status">No decks available.</p>
                )}

                <div className="decks-grid">
                    {decks.map((deck) => (
                        <article
                            key={deck.name}
                            className="deck-card"
                            aria-label={deck.name}
                        >
                            <Link
                                to={`/decks/${encodeURIComponent(deck.name)}`}
                                className="deck-link"
                                title={deck.name}
                            >
                                <div className="deck-art" aria-hidden>
                                    <img
                                        src={deck.artImageUrl}
                                        alt={deck.name}
                                    />
                                </div>

                                <div className="deck-footer">
                                    <div className="deck-hero-name">
                                        {deck.hero.name}
                                    </div>

                                    <div className="deck-stats-row">
                                        <div className="stat qty">{deck.hero.quantity > 1 ? `x${deck.hero.quantity}` : ''}</div>

                                        <div className="stat attack">
                                            <img
                                                className="attack-icon"
                                                src={`/attack_type/${attackTypeLabel(deck.hero.attackType)}.png`}
                                                alt={attackTypeLabel(deck.hero.attackType)}
                                                width={36}
                                                height={20}
                                            />
                                        </div>

                                        <div className="stat hp">
                                            <span className="hp-heart">❤</span>
                                            <span>{deck.hero.hp}</span>
                                        </div>

                                        <div className="stat attack">
                                            <img
                                                className="attack-icon-short"
                                                src={`/attack_type_short/${attackTypeLabel(deck.hero.attackType)}.png`}
                                                alt={attackTypeLabel(deck.hero.attackType)}
                                            />
                                        </div>

                                        <div className="stat move">
                                            <div className="move-label">↕</div>
                                            <div className="move-value">{deck.hero.move}</div>
                                        </div>
                                    </div>
                                </div>
                            </Link>
                        </article>
                    ))}
                </div>
            </div>
        </div>
    );
}
