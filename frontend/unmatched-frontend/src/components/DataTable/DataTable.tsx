import React from 'react';
import {SortState} from "../../hooks/useServerTable/useServerTable";

export interface Column<T> {
    key: string;
    label: string;
    sortable?: boolean;
    render: (item: T) => React.ReactNode;
}

interface DataTableProps<T> {
    columns: Column<T>[];
    data: T[];
    sortState: SortState;
    onSort: (field?: string) => void;
}

export function DataTable<T>({
                                 columns,
                                 data,
                                 sortState: {sortBy, direction},
                                 onSort,
                             }: DataTableProps<T>) {
    const renderArrow = (colKey: string) =>
        colKey === sortBy ? (direction === 'asc' ? ' ▲' : ' ▼') : '';

    return (
        <table style={{width: '100%', borderCollapse: 'collapse', marginTop: 16}}>
            <thead>
            <tr style={{background: '#f0f0f0'}}>
                {columns.map(col => (
                    <th
                        key={col.key}
                        style={{
                            padding: 8,
                            textAlign: 'left',
                            cursor: col.sortable ? 'pointer' : 'default',
                        }}
                        onClick={() => col.sortable && onSort(col.key)}
                    >
                        {col.label}
                        {col.sortable && renderArrow(col.key)}
                    </th>
                ))}
            </tr>
            </thead>

            <tbody>
            {data.map((item, rowIndex) => (
                <tr key={rowIndex}>
                    {columns.map(col => (
                        <td
                            key={col.key}
                            style={{padding: 8, borderBottom: '1px solid #ccc'}}
                        >
                            {col.render(item)}
                        </td>
                    ))}
                </tr>
            ))}
            </tbody>
        </table>
    );
}
