import React from 'react'
import {Link, useNavigate} from 'react-router-dom'
import {Column, DataTable} from '../../components/DataTable/DataTable'
import {useServerTable} from '../../hooks/useServerTable/useServerTable'
import {AttackType, DeckDto} from '../../types/deck'
import {getAll} from '../../api/deck'

function attackTypeLabel(type: AttackType) {
    return type.toLowerCase()
}

export function Decks() {
    const navigate = useNavigate()
    const {data: decks, loading, error, sortState, load} =
        useServerTable<DeckDto>(getAll)

    const columns: Column<DeckDto>[] = [
        {
            key: 'name',
            label: 'Deck name',
            sortable: true,
            render: deck => (
                <Link
                    to={`/decks/${encodeURIComponent(deck.name)}`}
                    style={{textDecoration: 'none', color: '#333'}}
                >
                    {deck.name}
                </Link>
            ),
        },
        {
            key: 'heroName',
            label: 'Hero name',
            sortable: true,
            render: deck => deck.hero.name,
        },
        {
            key: 'heroQuantity',
            label: 'Quantity',
            sortable: true,
            render: deck =>
                deck.hero.quantity > 1 ? `x${deck.hero.quantity}` : null,
        },
        {
            key: 'heroHp',
            label: 'Hp',
            sortable: true,
            render: deck => deck.hero.hp,
        },
        {
            key: 'heroMove',
            label: 'Move',
            sortable: true,
            render: deck => deck.hero.move,
        },
        {
            key: 'heroAttackType',
            label: 'Attack',
            sortable: true,
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
            label: 'Sidekick name',
            sortable: true,
            render: deck => deck.sidekick?.name ?? null,
        },
        {
            key: 'sidekick.quantity',
            label: 'Quantity',
            sortable: true,
            render: deck =>
                deck.sidekick?.quantity > 1
                    ? `x${deck.sidekick.quantity}`
                    : null,
        },
        {
            key: 'sidekickHp',
            label: 'Hp',
            sortable: true,
            render: deck => deck.sidekick?.hp ?? null,
        },
        {
            key: 'sidekickMove',
            label: 'Move',
            sortable: true,
            render: deck => deck.sidekick?.move ?? null,
        },
        {
            key: 'sidekickAttackType',
            label: 'Attack',
            sortable: true,
            render: deck =>
                deck.sidekick ? (
                    <img
                        src={`/attack_type/${attackTypeLabel(deck.sidekick.attackType)}.png`}
                        alt={attackTypeLabel(deck.sidekick.attackType)}
                        width={108}
                        height={27}
                    />
                ) : null,
        },
    ]

    return (
        <div style={{padding: 20}}>
            <h1>Decks</h1>

            <button
                style={{
                    marginBottom: 20,
                    padding: '10px 16px',
                    backgroundColor: '#007bff',
                    color: '#fff',
                    border: 'none',
                    borderRadius: 4,
                    cursor: 'pointer',
                }}
                onClick={() => navigate('/decks/top')}
            >
                Decks top
            </button>

            {loading && <p>Loading decks…</p>}
            {error && <p style={{color: 'red'}}>{error}</p>}
            {!loading && !error && decks.length === 0 && (
                <p>No decks available.</p>
            )}

            {decks.length > 0 && (
                <DataTable
                    columns={columns}
                    data={decks}
                    sortState={sortState}
                    onSort={load}
                />
            )}
        </div>
    )
}
