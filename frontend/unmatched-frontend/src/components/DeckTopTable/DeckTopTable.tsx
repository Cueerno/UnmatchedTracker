import React from 'react'
import { Link } from 'react-router-dom'
import { useClientTable } from '../../hooks/useClientTable/useClientTable'
import { getTop } from '../../api/deck'
import { DeckRatingDto } from '../../types/deck'
import {Column, DataTable} from "../DataTable/DataTable";

interface Props {
    format?: string
}

export function DeckTopTable({ format }: Props) {
    const {
        data: deckRatings,
        loading,
        error,
        sortState,
        onSort,
    } = useClientTable<DeckRatingDto>(() => getTop(format))

    const columns: Column<DeckRatingDto>[] = [
        {
            key: 'rating',
            label: '#',
            sortable: true,
            render: d => d.rating,
        },
        {
            key: 'name',
            label: 'Deck name',
            render: d => (
                <Link
                    to={`/decks/${encodeURIComponent(d.name)}`}
                    style={{ textDecoration: 'none', color: '#333' }}
                >
                    {d.name}
                </Link>
            ),
        },
        {
            key: 'win_count',
            label: 'Wins',
            sortable: true,
            render: d => d.win_count,
        },
    ]

    if (loading) return <p>Loading...</p>
    if (error)   return <p className="error">{error}</p>
    if (deckRatings.length === 0) return <p>No data.</p>

    return (
        <DataTable
            columns={columns}
            data={deckRatings}
            sortState={sortState}
            onSort={onSort}
        />
    )
}
