import React, {useEffect, useState} from 'react'
import {Link, useParams} from 'react-router-dom'
import {getByName} from '../../api/set'
import {SetDto} from '../../types/set'
import {AttackType} from '../../types/character'

function formatMonthYear(iso: string) {
    return new Date(iso).toLocaleDateString('en-EN', {
        month: 'long',
        year: 'numeric',
    })
}

function attackTypeLabel(type: AttackType) {
    return type.toLowerCase()
}

export function Set() {
    const {name: rawName} = useParams<{ name: string }>()
    const [set, setSet] = useState<SetDto | null>(null)
    const [loading, setLoading] = useState(false)
    const [error, setError] = useState<string | null>(null)

    useEffect(() => {
        if (!rawName) return
        setLoading(true)
        getByName(rawName)
            .then(data => setSet(data))
            .catch(err => setError(err.message || 'Loading error'))
            .finally(() => setLoading(false))
    }, [rawName])

    if (loading) return <p>Loading set details…</p>
    if (error) return <p style={{color: 'red'}}>{error}</p>
    if (!set) return null

    return (
        <div style={{padding: 20}}>
            <h1>{set.name}</h1>
            <p style={{marginTop: 4, color: '#666'}}>
                Released: {formatMonthYear(set.releaseDate)}
            </p>
            {set.description && (
                <p style={{fontStyle: 'italic', marginTop: 12}}>
                    {set.description}
                </p>
            )}

            <h2 style={{marginTop: 24}}>Characters</h2>
            <table
                style={{
                    width: '100%',
                    borderCollapse: 'collapse',
                    marginTop: 8,
                }}
            >
                <thead>
                <tr style={{background: '#f0f0f0'}}>
                    <th style={{padding: 8, textAlign: 'left'}}>Name</th>
                    <th style={{padding: 8, textAlign: 'left'}}>HP</th>
                    <th style={{padding: 8, textAlign: 'left'}}>Move</th>
                    <th style={{padding: 8, textAlign: 'left'}}>Attack</th>
                    <th style={{padding: 8, textAlign: 'left'}}>Sidekick</th>
                </tr>
                </thead>
                <tbody>
                {set.characters.map((ch, i) => (
                    <tr key={`${ch.name}-${i}`}>
                        <td style={{padding: 8, borderBottom: '1px solid #ccc'}}>
                            <Link
                                to={`/characters/${encodeURIComponent(ch.name)}`}
                                style={{textDecoration: 'none', color: '#333'}}
                            >
                                {ch.name}
                                {(ch.count > 1 ? <> x{ch.count}</> : null)}
                            </Link>
                        </td>
                        <td style={{padding: 8, borderBottom: '1px solid #ccc'}}>
                            {ch.hp}
                        </td>
                        <td style={{padding: 8, borderBottom: '1px solid #ccc'}}>
                            {ch.move}
                        </td>
                        <td style={{padding: 8, borderBottom: '1px solid #ccc'}}>
                            <img
                                src={`/attack_type/${attackTypeLabel(ch.attackType)}.png`}
                                alt={attackTypeLabel(ch.attackType)}
                                width={108}
                                height={27}
                            />
                        </td>
                        <td style={{padding: 8, borderBottom: '1px solid #ccc'}}>
                            {ch.sidekick ? (
                                <>
                                    {ch.sidekick.name}
                                    {ch.sidekick.count > 1 && <> x{ch.sidekick.count}</>}
                                </>
                            ) : (
                                '-'
                            )}
                        </td>
                    </tr>
                ))}
                </tbody>
            </table>

            <h2 style={{marginTop: 32}}>Boards</h2>
            <div
                style={{
                    display: 'flex',
                    gap: 24,
                    flexWrap: 'wrap',
                    marginTop: 8,
                }}
            >
                {set.boards.map((b, i) => (
                    <div
                        key={`${b.name}-${i}`}
                        style={{
                            border: '1px solid #ddd',
                            borderRadius: 4,
                            overflow: 'hidden',
                            width: 260,
                        }}
                    >
                        {b.imageUrl && (
                            <img
                                src={b.imageUrl}
                                alt={b.name}
                                style={{width: '100%', height: 160, objectFit: 'cover'}}
                            />
                        )}
                        <div style={{padding: 12}}>
                            <h3 style={{margin: '0 0 8px'}}>{b.name}</h3>
                            <p style={{margin: 0}}>
                                Players: {b.maxPlayers} | Spaces: {b.spaces} | Zones:{' '}
                                {b.zones}
                            </p>
                            {b.feature && (
                                <p style={{margin: '8px 0 0', color: '#555'}}>
                                    {b.feature}
                                </p>
                            )}
                        </div>
                    </div>
                ))}
            </div>
        </div>
    )
}
