import React from 'react';
import './SortPanel.css'
import {AutocompleteInput} from '../AutocompleteInput/AutocompleteInput';

export type SortDirection = 'asc' | 'desc';

export interface SortState {
    sortBy?: string;
    direction?: SortDirection;
}

export interface SortOption {
    label: string;
    value: string;
}

interface SortPanelProps {
    options: SortOption[];
    sortState: SortState;
    onSort: (field?: string) => void;

    // 🔹 новые пропы для поиска
    searchValue?: string;
    onSearchChange?: (val: string) => void;
    fetchSearchOptions?: () => Promise<string[]>;

    className?: string;
}

export const SortPanel: React.FC<SortPanelProps> = ({
                                                        options,
                                                        sortState,
                                                        onSort,
                                                        searchValue,
                                                        onSearchChange,
                                                        fetchSearchOptions,
                                                        className
                                                    }) => {
    const handleFieldChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
        const value = e.target.value;
        onSort(value || undefined);
    };

    const toggleDirection = () => {
        if (!sortState.sortBy) return;
        onSort(sortState.sortBy);
    };

    return (
        <div className={`sort-panel ${className ?? ''}`} role="region" aria-label="Sorting panel">
            {onSearchChange && fetchSearchOptions && (
                <div className="search-section">
                    <AutocompleteInput
                        value={searchValue ?? ''}
                        onChange={onSearchChange}
                        fetchOptions={fetchSearchOptions}
                        placeholder="Search..."
                    />
                    {searchValue && (
                        <button
                            type="button"
                            className="search-clear"
                            onClick={() => onSearchChange('')}
                            title="Clear search"
                        >
                            ✕
                        </button>
                    )}
                </div>
            )}

            <label className="sort-label">
                Sort by
                <select
                    className="sort-select"
                    value={sortState.sortBy ?? ''}
                    onChange={handleFieldChange}
                >
                    <option value="">— none —</option>
                    {options.map(opt => (
                        <option key={opt.value} value={opt.value}>
                            {opt.label}
                        </option>
                    ))}
                </select>
            </label>

            <div className="sort-controls">
                <button
                    type="button"
                    className="sort-toggle"
                    onClick={toggleDirection}
                    disabled={!sortState.sortBy}
                    title="Toggle direction"
                    aria-pressed={sortState.direction === 'desc'}
                >
                    {sortState.direction === 'desc' ? '↓' : '↑'}
                </button>

                <button
                    type="button"
                    className="sort-clear"
                    onClick={() => onSort(undefined)}
                    disabled={!sortState.sortBy}
                    title="Clear sorting"
                >
                    Clear
                </button>

                <div className="sort-info" aria-live="polite">
                    {sortState.sortBy ? (
                        <span>
                            {options.find(o => o.value === sortState.sortBy)?.label ?? sortState.sortBy}
                            {' '}
                            ({sortState.direction ?? 'asc'})
                        </span>
                    ) : (
                        <span>Not sorted</span>
                    )}
                </div>
            </div>
        </div>
    );
};
