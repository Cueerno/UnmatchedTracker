import React from 'react';
import type {SortState} from '../../hooks/useClientTable/useClientTable';
import './DataTable.css';

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
    const renderArrows = (colKey: string, sortable?: boolean) => {
        if (!sortable) return null;
        const isActive = colKey === sortBy;
        return (
            <span className="sort-arrows">
        <span className={`arrow up ${isActive && direction === 'asc' ? 'active' : ''}`}>▲</span>
        <span className={`arrow down ${isActive && direction === 'desc' ? 'active' : ''}`}>▼</span>
      </span>
        );
    };

    return (
        <div className="data-table-container">
            <div className="scrollable">
                <div className="mask">
                    <table>
                        <thead>
                        <tr>
                            {columns.map(col => (
                                <th
                                    key={col.key}
                                    className={col.sortable ? 'sortable' : ''}
                                    onClick={() => col.sortable && onSort(col.key)}
                                >
                                    <div className="header-content">
                                        <span className="label">{col.label}</span>
                                        {renderArrows(col.key, col.sortable)}
                                    </div>
                                </th>
                            ))}
                        </tr>
                        </thead>

                        <tbody>
                        {data.map((item, rowIndex) => (
                            <tr key={rowIndex}>
                                {columns.map(col => (
                                    <td key={col.key} data-label={col.label}>
                                        {col.render(item)}
                                    </td>
                                ))}
                            </tr>
                        ))}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    );
}
