import React from 'react'
import {DataTable, Column} from '../../components/DataTable/DataTable'
import {useServerTable} from '../../hooks/useServerTable/useServerTable'
import {getAll} from '../../api/board'
import {BoardDto} from '../../types/board'

export function Boards() {
    const {data: boards, loading, error, sortState, load} =
        useServerTable<BoardDto>(getAll)

    const columns: Column<BoardDto>[] = [
        {
            key: 'imageUrl',
            label: 'Image',
            render: board =>
                board.imageUrl ? (
                    <img
                        src={board.imageUrl}
                        alt={board.name}
                        style={{width: 260, height: 162.5, objectFit: 'cover'}}
                    />
                ) : null,
        },
        {
            key: 'name',
            label: 'Name',
            sortable: true,
            render: board => board.name,
        },
        {
            key: 'maxPlayers',
            label: 'Max. players',
            sortable: true,
            render: board => board.maxPlayers,
        },
        {
            key: 'spaces',
            label: 'Spaces',
            sortable: true,
            render: board => board.spaces,
        },
        {
            key: 'zones',
            label: 'Zones',
            sortable: true,
            render: board => board.zones,
        },
        {
            key: 'feature',
            label: 'Feature',
            render: board => board.feature,
        },
    ]

    return (
        <div style={{padding: 20}}>
            <h1>Boards</h1>

            {loading && <p>Loading...</p>}
            {error && <p style={{color: 'red'}}>{error}</p>}
            {!loading && !error && boards.length === 0 && <p>No boards available.</p>}

            {boards.length > 0 && (
                <DataTable
                    columns={columns}
                    data={boards}
                    sortState={sortState}
                    onSort={load}
                />
            )}
        </div>
    )
}
