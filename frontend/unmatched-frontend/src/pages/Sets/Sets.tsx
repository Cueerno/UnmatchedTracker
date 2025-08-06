import React from 'react';
import {Link} from 'react-router-dom';
import {Column, DataTable} from '../../components/DataTable/DataTable';
import {useClientTable} from '../../hooks/useClientTable/useClientTable';
import {getAll} from '../../api/set';
import {SetDto} from '../../types/set';

export function Sets() {
    const {
        data: sets,
        loading,
        error,
        sortState,
        onSort,
    } = useClientTable<SetDto>(getAll);

    const columns: Column<SetDto>[] = [
        {
            key: 'name',
            label: 'Name',
            sortable: true,
            render: set => (
                <Link
                    to={`/sets/${encodeURIComponent(set.name)}`}
                    style={{textDecoration: 'none', color: '#333'}}
                >
                    {set.name}
                </Link>
            ),
        },
        {
            key: 'decks',
            label: 'Decks',
            render: set =>
                set.decks.map((deck, idx) => (
                    <React.Fragment key={deck.name}>
                        <Link
                            to={`/decks/${encodeURIComponent(deck.name)}`}
                            style={{textDecoration: 'none', color: '#333'}}
                        >
                            {deck.name}
                        </Link>
                        {idx < set.decks.length - 1 && ', '}
                    </React.Fragment>
                )),
        },
        {
            key: 'boards',
            label: 'Boards',
            render: set => set.boards.map(b => b.name).join(', '),
        },
        {
            key: 'releaseDate',
            label: 'Release Date',
            sortable: true,
            render: set => {
                const year = new Date(set.releaseDate).getFullYear();
                if (year > new Date().getFullYear()) {
                    return 'Unknown';
                }
                return new Date(set.releaseDate).toLocaleDateString('en-EN', {
                    month: 'long',
                    year: 'numeric',
                });
            },
        },
    ];

    return (
        <div style={{padding: 20}}>
            <h1>Sets</h1>
            {loading && <p>Loading...</p>}
            {error && <p style={{color: 'red'}}>{error}</p>}
            {!loading && !error && sets.length === 0 && <p>No sets available.</p>}

            {sets.length > 0 && (
                <DataTable
                    columns={columns}
                    data={sets}
                    sortState={sortState}
                    onSort={onSort}
                />
            )}
        </div>
    );
}
