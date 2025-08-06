import { useState, useEffect, useRef } from 'react';

type Dir = 'asc' | 'desc';

export interface SortState {
    sortBy?: string;
    direction?: Dir;
}

export function useClientTable<T>(
    fetcher: () => Promise<T[]>
): {
    data: T[];
    loading: boolean;
    error: string | null;
    sortState: SortState;
    onSort: (field?: string) => void;
} {
    const [original, setOriginal] = useState<T[]>([]);
    const [data, setData] = useState<T[]>([]);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState<string | null>(null);

    const [sortBy, setSortBy] = useState<string | undefined>(undefined);
    const [direction, setDirection] = useState<Dir | undefined>(undefined);

    const didFetchOnce = useRef(false);

    const getValue = (item: any, path?: string) => {
        if (!path) return undefined;
        return path.split('.').reduce((o, key) => (o == null ? undefined : o[key]), item);
    };

    const sortData = (field?: string, dir?: Dir) => {
        if (!field || !dir) {
            setData([...original]);
            return;
        }

        const sorted = [...original].sort((a, b) => {
            const va = getValue(a, field);
            const vb = getValue(b, field);

            if (va == null && vb != null) return -1;
            if (vb == null && va != null) return 1;
            if (va == null && vb == null) return 0;

            if (typeof va === 'string' && typeof vb === 'string') {
                return va.localeCompare(vb);
            }

            if (typeof va === 'number' && typeof vb === 'number') {
                return va - vb;
            }

            return String(va).localeCompare(String(vb));
        });

        if (dir === 'desc') {
            sorted.reverse();
        }
        setData(sorted);
    };

    useEffect(() => {
        if (didFetchOnce.current) return;
        didFetchOnce.current = true;

        setLoading(true);
        fetcher()
            .then(items => {
                setOriginal(items);
                setData(items);
            })
            .catch(e => setError(e.message || 'Loading error'))
            .finally(() => setLoading(false));
    }, [fetcher]);

    const onSort = (field?: string) => {
        let nextDir: Dir | undefined;
        if (field) {
            nextDir = field === sortBy ? (direction === 'asc' ? 'desc' : 'asc') : 'asc';
            setSortBy(field);
            setDirection(nextDir);
        } else {
            setSortBy(undefined);
            setDirection(undefined);
        }
        sortData(field, nextDir);
    };

    return {
        data,
        loading,
        error,
        sortState: { sortBy, direction },
        onSort,
    };
}
