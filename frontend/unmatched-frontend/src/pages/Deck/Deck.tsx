import React, {useEffect, useState} from 'react';
import {useParams} from 'react-router-dom';
import {getByName} from '../../api/deck';
import {AttackType, DeckDto} from "../../types/deck";
import './Deck.css'

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

    return (
        <div style={{padding: '20px'}}>
            {loading && <p>Loading...</p>}
            {error && <p style={{color: 'red'}}>{error}</p>}
            {deck && (
                <div style={{marginTop: '16px'}}>
                    <h1>{deck.name}</h1>
                    <h2>

                        {deck.hero.name}
                        {deck.hero.quantity > 1 && (
                            <span style={{marginLeft: '8px', fontWeight: 'normal'}}>
                                x{deck.hero.quantity}
                            </span>
                        )}
                    </h2>
                    <p>HP: {deck.hero.hp}</p>
                    <p>Move: {deck.hero.move}</p>
                    <img
                        src={`/attack_type/${attackTypeLabel(deck.hero.attackType)}.png`}
                        alt={attackTypeLabel(deck.hero.attackType)}
                        width={108}
                        height={27}
                    />

                    {deck.extraCharacters && (
                        <div>
                            {deck.extraCharacters.map(extra => (
                                <div>
                                    <h2>
                                        {extra.name}
                                        {extra.quantity > 1 && (
                                            <span style={{marginLeft: '8px', fontWeight: 'normal'}}>
                                                x{extra.quantity}
                                            </span>
                                        )}
                                    </h2>
                                    <p>HP: {extra.hp}</p>
                                    <p>Move: {extra.move}</p>
                                    <img
                                        src={`/attack_type/${attackTypeLabel(extra.attackType)}.png`}
                                        alt={attackTypeLabel(extra.attackType)}
                                        width={108}
                                        height={27}
                                    />
                                </div>
                            ))}
                        </div>
                    )}

                    {deck.sidekick && (
                        <div
                            style={{
                                marginTop: '24px',
                                padding: '12px',
                                border: '1px solid #ccc',
                                borderRadius: '6px',
                                background: '#f9f9f9',
                            }}
                        >
                            <h3>
                                {deck.sidekick.name}
                                {deck.sidekick?.quantity > 1 && (<span> x{deck.sidekick.quantity}</span>)}
                            </h3>
                            <p>HP: {deck.sidekick.hp}</p>
                            <p>Move: {deck.sidekick.move}</p>
                            <img
                                src={`/attack_type/${attackTypeLabel(deck.sidekick.attackType)}.png`}
                                alt={attackTypeLabel(deck.sidekick.attackType)}
                                width={108}
                                height={27}
                            />
                        </div>
                    )}
                </div>
            )}
        </div>
    );
}
