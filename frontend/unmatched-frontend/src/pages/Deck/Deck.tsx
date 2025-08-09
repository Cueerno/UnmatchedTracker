import React, {useEffect, useState} from 'react';
import {useParams} from 'react-router-dom';
import {getByName} from '../../api/deck';
import {AttackType, DeckDto} from '../../types/deck';
import './Deck.css';

export function Deck() {
    const {name} = useParams<{ name: string }>();
    const [deck, setDeck] = useState<DeckDto | null>(null);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState<string | null>(null);

    useEffect(() => {
        if (!name) return;
        setLoading(true);
        getByName(name)
            .then(data => setDeck(data))
            .catch(err => setError(err.message || 'Loading error'))
            .finally(() => setLoading(false));
    }, [name]);

    const attackTypeLabel = (type: AttackType) => type.toLowerCase();

    if (loading) return <p className="deck-loading">Loading...</p>;
    if (error) return <p className="deck-error">{error}</p>;

    return deck ? (
        <div className="deck-container">
            <div className="deck-header">
                <div className="deck-info">
                    <h1 className="deck-title">
                        {deck.name}
                        <span className="deck-set">from {deck.setName}</span>
                    </h1>
                </div>
            </div>

            <div className="deck-stats">
                <h2 className="hero-name">
                    {deck.hero.name}
                    {deck.hero.quantity > 1 && (
                        <span className="hero-qty">x{deck.hero.quantity}</span>
                    )}
                </h2>
                <p className="hero-detail">HP: {deck.hero.hp}</p>
                <p className="hero-detail">Move: {deck.hero.move}</p>
                <img
                    className="attack-icon"
                    src={`/attack_type/${attackTypeLabel(deck.hero.attackType)}.png`}
                    alt={attackTypeLabel(deck.hero.attackType)}
                />
                <p className="hero-ability">{deck.hero.specialAbility}</p>
            </div>

            {deck.extraCharacters?.length > 0 && (
                <div className="extra-characters">
                    {deck.extraCharacters.map(extra => (
                        <div key={extra.name} className="extra-char">
                            <h2 className="extra-name">
                                {extra.name}
                                {extra.quantity > 1 && (
                                    <span className="hero-qty">x{extra.quantity}</span>
                                )}
                            </h2>
                            <p className="hero-detail">HP: {extra.hp}</p>
                            <p className="hero-detail">Move: {extra.move}</p>
                            <img
                                className="attack-icon"
                                src={`/attack_type/${attackTypeLabel(extra.attackType)}.png`}
                                alt={attackTypeLabel(extra.attackType)}
                            />
                        </div>
                    ))}
                </div>
            )}

            {deck.sidekick && (
                <div className="sidekick">
                    <h3 className="sidekick-title">Sidekick</h3>
                    <h4>
                        {deck.sidekick.name}
                        {deck.sidekick.quantity > 1 && (
                            <span className="hero-qty">x{deck.sidekick.quantity}</span>
                        )}
                    </h4>
                    <p className="hero-detail">HP: {deck.sidekick.hp}</p>
                    <p className="hero-detail">Move: {deck.sidekick.move}</p>
                    <img
                        className="attack-icon"
                        src={`/attack_type/${attackTypeLabel(deck.sidekick.attackType)}.png`}
                        alt={attackTypeLabel(deck.sidekick.attackType)}
                    />
                </div>
            )}

            <p>Cards</p>
        </div>
    ) : null;
}
