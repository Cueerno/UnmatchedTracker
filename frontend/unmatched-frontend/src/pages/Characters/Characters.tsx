import React from 'react'
import {Link, useNavigate} from 'react-router-dom'
import {Column, DataTable} from '../../components/DataTable/DataTable'
import {useServerTable} from '../../hooks/useServerTable/useServerTable'
import {getAll} from '../../api/character'
import {AttackType, CharacterDto} from '../../types/character'

function attackTypeLabel(type: AttackType) {
    return type.toLowerCase()
}

export function Characters() {
    const navigate = useNavigate()

    const {
        data: characters,
        loading,
        error,
        sortState,
        load,
    } = useServerTable<CharacterDto>(getAll)

    const columns: Column<CharacterDto>[] = [
        {
            key: 'name',
            label: 'Name',
            sortable: true,
            render: ch => (
                <Link
                    to={`/characters/${encodeURIComponent(ch.name)}`}
                    style={{textDecoration: 'none', color: '#333'}}
                >
                    {ch.name}
                </Link>
            ),
        },
        {
            key: 'count',
            label: 'Count',
            sortable: true,
            render: ch => (ch.count > 1 ? <>x{ch.count}</> : null),
        },
        {
            key: 'hp',
            label: 'Hp',
            sortable: true,
            render: ch => ch.hp,
        },
        {
            key: 'move',
            label: 'Move',
            sortable: true,
            render: ch => ch.move,
        },
        {
            key: 'attackType',
            label: 'Attack',
            sortable: true,
            render: ch => (
                <img
                    src={`/attack_type/${attackTypeLabel(ch.attackType)}.png`}
                    alt={attackTypeLabel(ch.attackType)}
                    width={108}
                    height={27}
                />
            ),
        },
        {
            key: 'sidekick',
            label: 'Sidekick',
            render: ch => ch.sidekick?.name || '',
        },
    ]

    return (
        <div style={{padding: 20}}>
            <h1>Characters</h1>

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
                onClick={() => navigate('/characters/top')}
            >
                Characters top
            </button>

            {loading && <p>Loading...</p>}
            {error && <p style={{color: 'red'}}>{error}</p>}
            {!loading && !error && characters.length === 0 && (
                <p>No characters available.</p>
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
    )
}