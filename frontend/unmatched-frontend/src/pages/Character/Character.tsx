import React, {useEffect, useState} from 'react';
import {useParams} from 'react-router-dom';
import {getByName} from '../../api/character';
import {AttackType, CharacterDto} from "../../types/character";

export function Character() {
    const {name} = useParams<{ name: string }>();
    const [character, setCharacter] = useState<CharacterDto | null>(null);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState<string | null>(null);

    useEffect(() => {
        if (!name) return;
        setLoading(true);
        getByName(name)
            .then(data => setCharacter(data))
            .catch(err => setError(err.message || 'Loading error'))
            .finally(() => setLoading(false));
    }, [name]);

    const attackTypeLabel = (type: AttackType) => type.toLowerCase();

    return (
        <div style={{padding: '20px'}}>
            <h1>Character page</h1>
            {loading && <p>Loading...</p>}
            {error && <p style={{color: 'red'}}>{error}</p>}
            {character && (
                <div style={{marginTop: '16px'}}>
                    <h2>
                        {character.name}
                        {character.count > 1 && (
                            <span style={{ marginLeft: '8px', fontWeight: 'normal' }}>
                                x{character.count}
                            </span>
                        )}
                    </h2>
                    <p>HP: {character.hp}</p>
                    <p>Move: {character.move}</p>
                    <img
                        src={`/attack_type/${attackTypeLabel(character.attackType)}.png`}
                        alt={attackTypeLabel(character.attackType)}
                        width={108}
                        height={27}
                    />

                    {character.sidekick && (
                        <div
                            style={{
                                marginTop: '24px',
                                padding: '12px',
                                border: '1px solid #ccc',
                                borderRadius: '6px',
                                background: '#f9f9f9',
                            }}
                        >
                            <h3>{character.sidekick.name}</h3>
                            {character.sidekick?.count > 1 && (<p>Count: {character.sidekick.count}</p>)}
                            <p>HP: {character.sidekick.hp}</p>
                            <p>Move: {character.sidekick.move}</p>
                            <img
                                src={`/attack_type/${attackTypeLabel(character.sidekick.attackType)}.png`}
                                alt={attackTypeLabel(character.sidekick.attackType)}
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
