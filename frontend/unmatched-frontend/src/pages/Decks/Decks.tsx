import React from 'react'
import {Link} from 'react-router-dom'
import {Column, DataTable} from '../../components/DataTable/DataTable'
import {useClientTable} from '../../hooks/useClientTable/useClientTable'
import {AttackType, DeckDto} from '../../types/deck'
import {getAll} from '../../api/deck'

function attackTypeLabel(type: AttackType) {
    return type.toLowerCase()
}

export function Decks() {
    const {
        data: decks,
        loading,
        error,
        sortState,
        onSort,
    } = useClientTable<DeckDto>(getAll)

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
            key: 'hero.name',
            label: 'Hero name',
            sortable: true,
            render: deck => deck.hero.name,
        },
        {
            key: 'hero.quantity',
            label: 'Quantity',
            sortable: true,
            render: deck => (deck.hero.quantity > 1 ? `x${deck.hero.quantity}` : null),
        },
        {
            key: 'hero.hp',
            label: 'Hp',
            sortable: true,
            render: deck => deck.hero.hp,
        },
        {
            key: 'hero.move',
            label: 'Move',
            sortable: true,
            render: deck => deck.hero.move,
        },
        {
            key: 'hero.attackType',
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
            key: 'sidekick.name',
            label: 'Sidekick name',
            sortable: true,
            render: deck => deck.sidekick?.name ?? null,
        },
        {
            key: 'sidekick.quantity',
            label: 'Quantity',
            sortable: true,
            render: deck =>
                deck.sidekick?.quantity && deck.sidekick.quantity > 1
                    ? `x${deck.sidekick.quantity}`
                    : null,
        },
        {
            key: 'sidekick.hp',
            label: 'Hp',
            sortable: true,
            render: deck => deck.sidekick?.hp ?? null,
        },
        {
            key: 'sidekick.move',
            label: 'Move',
            sortable: true,
            render: deck => deck.sidekick?.move ?? null,
        },
        {
            key: 'sidekick.attackType',
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

            {loading && <p>Loading decks…</p>}
            {error && <p style={{color: 'red'}}>{error}</p>}
            {!loading && !error && decks.length === 0 && <p>No decks available.</p>}

            {decks.length > 0 && (
                <DataTable
                    columns={columns}
                    data={decks}
                    sortState={sortState}
                    onSort={onSort}
                />
            )}
        </div>
    )
}
