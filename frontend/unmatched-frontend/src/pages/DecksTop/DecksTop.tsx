import {getTopByWins} from '../../api/deck';
import {Column, DataTable} from "../../components/DataTable/DataTable";
import {DeckRatingDto} from "../../types/deck";
import {useServerTable} from "../../hooks/useServerTable/useServerTable";
import React from "react";
import {Link} from "react-router-dom";

export function DecksTop() {
    const {
        data: characters,
        loading,
        error,
        sortState,
        load,
    } = useServerTable<DeckRatingDto>(getTopByWins)

    const columns: Column<DeckRatingDto>[] = [
        {
            key: 'rating',
            label: '#',
            sortable: false,
            render: deck => deck.rating
        },
        {
            key: 'deck',
            label: 'Deck',
            sortable: false,
            render: deck => (
                <Link
                    to={`/decks/${encodeURIComponent(deck.name)}`}
                    style={{textDecoration: 'none', color: '#333'}}
                >
                    {deck.name}
                </Link>)
        },
        {
            key: 'win_count',
            label: 'Wins',
            sortable: false,
            render: deck => deck.win_count
        },
    ];

    return (
        <div style={{padding: '20px'}}>
            <h1>Character Ranking by Wins</h1>

            {loading && <p> Loading...</p>}
            {error && <p style={{color: 'red'}}>{error}</p>}

            {!loading && characters.length === 0 && !error && (
                <p>No data.</p>
            )}

            {characters.length > 0 && (
                <DataTable
                    columns={columns}
                    data={characters}
                    sortState={sortState}
                    onSort={load}
                />
            )}
        </div>
    );
}
