import {useEffect, useRef, useState} from 'react';

export interface SortState {
    sortBy: string | undefined;
    direction: 'asc' | 'desc' | undefined;
}

export function useServerTable<T>(
    fetcher: (sortBy?: string, direction?: 'asc' | 'desc') => Promise<T[]>
) {
    const [data, setData] = useState<T[]>([]);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState<string | null>(null);

    const [sortBy, setSortBy] = useState<string | undefined>(undefined);
    const [direction, setDirection] = useState<'asc' | 'desc' | undefined>(undefined);
    const didFetchOnce = useRef(false);

    const load = (field?: string) => {
        let nextSort: string | undefined;
        let nextDir: 'asc' | 'desc' | undefined;

        if (field) {
            const dir =
                field === sortBy
                    ? (direction === 'asc' ? 'desc' : 'asc')
                    : 'asc';

            setSortBy(field);
            setDirection(dir);
            nextSort = field;
            nextDir = dir;
        } else {
            setSortBy(undefined);
            setDirection(undefined);
            nextSort = undefined;
            nextDir = undefined;
        }

        setLoading(true);
        setError(null);

        fetcher(nextSort, nextDir)
            .then(setData)
            .catch(e => setError(e.message || 'Loading error'))
            .finally(() => setLoading(false));
    };

    useEffect(() => {
        if (!didFetchOnce.current) {
            didFetchOnce.current = true;
            load();
        }
    }, []);

    return {
        data,
        loading,
        error,
        sortState: {sortBy, direction},
        load,
    };
}
