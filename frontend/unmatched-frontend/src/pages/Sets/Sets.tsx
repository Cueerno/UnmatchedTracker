import React from 'react';
import {Link} from 'react-router-dom';
import {getAll} from '../../api/set';
import {SetDto} from '../../types/set';
import {useServerTable} from "../../hooks/useServerTable/useServerTable";
import {Column, DataTable} from "../../components/DataTable/DataTable";

export function Sets() {
    const {data: sets, loading, error, sortState, load} = useServerTable<SetDto>(getAll);

    const columns: Column<SetDto>[] = [
        {
            key: 'name',
            label: 'Name',
            sortable: true,
            render: set => set.name,
        },
        {
            key: 'characters',
            label: 'Characters',
            render: set =>
                set.characters.map((ch, idx) => (
                    <React.Fragment key={ch.name}>
                        <Link to={`/characters/${encodeURIComponent(ch.name)}`}>
                            {ch.name}
                        </Link>
                        {idx < set.characters.length - 1 && ', '}
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
            render: set =>
                new Date(set.releaseDate)
                    .toLocaleDateString('en-EN', {month: 'long', year: 'numeric'}),
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
                    onSort={load}
                />
            )}
        </div>
    );
}
