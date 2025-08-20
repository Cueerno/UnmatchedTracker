import React, {useEffect, useState} from 'react'
import {Link, useParams} from 'react-router-dom'
import {getByName} from '../../api/set'
import {SetDto} from '../../types/set'
import {AttackType} from '../../types/deck'
import {Column, DataTable} from '../../components/DataTable/DataTable'

function formatMonthYear(iso: string) {
    return new Date(iso).getFullYear() > new Date().getFullYear()
        ? 'Unknown'
        : new Date(iso).toLocaleDateString('en-EN', {
            month: 'long',
            year: 'numeric',
        })
}

function attackTypeLabel(type: AttackType) {
    return type.toLowerCase()
}

export default function Set() {
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

    type Deck = typeof set.decks[0]

    const deckColumns: Column<Deck>[] = [
        {
            key: 'name',
            label: 'Name',
            render: deck => (
                <Link
                    to={`/decks/${encodeURIComponent(deck.name)}`}
                    style={{textDecoration: 'none', color: '#333'}}
                >
                    {deck.name}
                    {deck.hero.quantity > 1 && <> x{deck.hero.quantity}</>}
                </Link>
            ),
        },
        {
            key: 'hp',
            label: 'HP',
            render: deck => deck.hero.hp,
        },
        {
            key: 'move',
            label: 'Move',
            render: deck => deck.hero.move,
        },
        {
            key: 'attack',
            label: 'Attack',
            render: deck => (
                <img
                    src={`/attack_type/${attackTypeLabel(deck.hero.attackType)}.png`}
                    alt={attackTypeLabel(deck.hero.attackType)}
                    width={108}
                    height={27}
                />
            ),
        },
        {
            key: 'sidekickName',
            label: 'Sidekick',
            render: deck =>
                deck.sidekick ? (
                    <>
                        {deck.sidekick.name}
                        {deck.sidekick.quantity > 1 && <> x{deck.sidekick.quantity}</>}
                    </>
                ) : null
        },
        {
            key: 'sidekickHp',
            label: 'HP',
            render: deck =>
                deck.sidekick ? (
                    <>
                        {deck.sidekick.hp}
                    </>
                ) : null
        },
        {
            key: 'sidekickMove',
            label: 'Move',
            render: deck =>
                deck.sidekick ? (
                    <>
                        {deck.sidekick.move}
                    </>
                ) : null
        },
        {
            key: 'sidekickAttackType',
            label: 'Move',
            render: deck =>
                deck.sidekick ? (
                    <img
                        src={`/attack_type/${attackTypeLabel(deck.sidekick.attackType)}.png`}
                        alt={attackTypeLabel(deck.hero.attackType)}
                        width={108}
                        height={27}
                    />
                ) : null
        },
    ]

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
            <DataTable
                columns={deckColumns}
                data={set.decks}
                sortState={{}}
                onSort={() => {
                }}
            />

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
