import React from 'react'
import {Link} from 'react-router-dom'
import {Column, DataTable} from '../../components/DataTable/DataTable'
import {useClientTable} from '../../hooks/useClientTable/useClientTable'
import {getTopByWins} from '../../api/deck'
import {DeckRatingDto} from '../../types/deck'

export function DecksTop() {
    const {
        data: deckRatings,
        loading,
        error,
        sortState,
        onSort,
    } = useClientTable<DeckRatingDto>(getTopByWins)

    const columns: Column<DeckRatingDto>[] = [
        {
            key: 'rating',
            label: '#',
            sortable: true,
            render: deck => deck.rating,
        },
        {
            key: 'name',
            label: 'Deck name',
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
            key: 'win_count',
            label: 'Wins',
            sortable: true,
            render: deck => deck.win_count,
        },
    ]

    return (
        <div style={{padding: '20px'}}>
            <h1>Decks Ranking by Wins</h1>

            {loading && <p>Loading...</p>}
            {error && <p style={{color: 'red'}}>{error}</p>}
            {!loading && !error && deckRatings.length === 0 && <p>No data.</p>}

            {deckRatings.length > 0 && (
                <DataTable
                    columns={columns}
                    data={deckRatings}
                    sortState={sortState}
                    onSort={onSort}
                />
            )}
        </div>
    )
}
