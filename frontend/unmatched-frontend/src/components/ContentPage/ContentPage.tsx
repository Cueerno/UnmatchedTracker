import React from 'react';
import {useClientTable} from '../../hooks/useClientTable/useClientTable';
import {SortPanel} from '../SortPanel/SortPanel';
import {CardItem} from '../CardItem/CardItem';
import "./ContentPage.css"

export interface SortOption {
    label: string;
    value: string;
}

interface ContentPageProps<T> {
    title: string;
    fetchFn: () => Promise<T[]>;
    sortOptions: SortOption[];
    renderCard: (item: T) => React.ReactNode;
    keyExtractor: (item: T) => string;
    gridClassName?: string;
    pageClassName?: string;
    contentContainerClassName?: string;
}

export function ContentPage<T>({
                                   title,
                                   fetchFn,
                                   sortOptions,
                                   renderCard,
                                   keyExtractor,
                               }: ContentPageProps<T>) {
    const {data = [], loading, error, sortState, onSort} = useClientTable<T>(fetchFn);

    return (
        <div className="content-page">
            <div className="content-container">
                <h1>{title}</h1>

                <SortPanel
                    options={sortOptions}
                    sortState={sortState}
                    onSort={onSort}
                />

                {loading && <p>Loading {title.toLowerCase()}…</p>}
                {error && <p className="error">{error}</p>}
                {!loading && !error && data.length === 0 && (
                    <p>No {title.toLowerCase()} available.</p>
                )}

                <div className="content-grid">
                    {data.map(item => (
                        <CardItem
                            key={keyExtractor(item)}
                            data={item}
                            className="content-card-wrapper"
                            renderContent={() => renderCard(item)}
                        />
                    ))}
                </div>
            </div>
        </div>
    );
}
