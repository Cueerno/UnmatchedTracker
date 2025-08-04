import {getTopByWins} from '../../api/character';
import {Column, DataTable} from "../../components/DataTable/DataTable";
import {CharacterTopItem} from "../../types/character";
import {useServerTable} from "../../hooks/useServerTable/useServerTable";
import React from "react";
import {Link} from "react-router-dom";

export function CharactersTop() {
    const {
        data: characters,
        loading,
        error,
        sortState,
        load,
    } = useServerTable<CharacterTopItem>(getTopByWins)

    const columns: Column<CharacterTopItem>[] = [
        {
            key: 'rating',
            label: '#',
            sortable: false,
            render: ch => ch.rating
        },
        {
            key: 'character',
            label: 'Character',
            sortable: false,
            render: ch => (
                <Link
                    to={`/characters/${encodeURIComponent(ch.name)}`}
                    style={{textDecoration: 'none', color: '#333'}}
                >
                    {ch.name}
                </Link>)
        },
        {
            key: 'win_count',
            label: 'Wins',
            sortable: false,
            render: ch => ch.win_count
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
