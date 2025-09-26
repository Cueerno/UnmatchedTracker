import { useState, useEffect, useRef } from 'react';

type Dir = 'asc' | 'desc';

export interface SortState {
    sortBy?: string;
    direction?: Dir;
}

export function useClientTable<T>(
    fetcher: () => Promise<T[]>,
    opts?: {
        searchFields?: string[];
    }
): {
    data: T[];
    loading: boolean;
    error: string | null;
    sortState: SortState;
    onSort: (field?: string) => void;

    searchQuery: string;
    setSearchQuery: (q: string) => void;
} {
    const [original, setOriginal] = useState<T[]>([]);
    const [data, setData] = useState<T[]>([]);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState<string | null>(null);

    const [sortBy, setSortBy] = useState<string | undefined>(undefined);
    const [direction, setDirection] = useState<Dir | undefined>(undefined);

    const [searchQuery, setSearchQuery] = useState<string>('');

    const didFetchOnce = useRef(false);

    const getValue = (item: any, path?: string) => {
        if (!path) return undefined;
        return path.split('.').reduce((o, key) => (o == null ? undefined : o[key]), item);
    };

    const compareValues = (va: any, vb: any) => {
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
    };

    useEffect(() => {
        let base: T[] = [...original];

        if (searchQuery && searchQuery.trim() !== '') {
            const q = searchQuery.trim().toLowerCase();
            const fields = opts?.searchFields;

            base = base.filter(item => {
                if (fields && fields.length > 0) {
                    return fields.some(f => {
                        const v = getValue(item, f);
                        return v != null && String(v).toLowerCase().includes(q);
                    });
                } else {
                    // fallback: stringify whole item
                    return JSON.stringify(item).toLowerCase().includes(q);
                }
            });
        }

        if (sortBy) {
            base.sort((a, b) => {
                const va = getValue(a, sortBy);
                const vb = getValue(b, sortBy);
                return compareValues(va, vb);
            });
            if (direction === 'desc') base.reverse();
        }

        setData(base);
    }, [original, searchQuery, sortBy, direction, opts?.searchFields]);

    useEffect(() => {
        if (didFetchOnce.current) return;
        didFetchOnce.current = true;

        setLoading(true);
        fetcher()
            .then(items => {
                setOriginal(items);
                setData(items);
            })
            .catch(e => setError(e?.message || 'Loading error'))
            .finally(() => setLoading(false));
    }, [fetcher]);

    const onSort = (field?: string) => {
        if (field) {
            const nextDir = field === sortBy ? (direction === 'asc' ? 'desc' : 'asc') : 'asc';
            setSortBy(field);
            setDirection(nextDir);
        } else {
            setSortBy(undefined);
            setDirection(undefined);
        }
    };

    return {
        data,
        loading,
        error,
        sortState: { sortBy, direction },
        onSort,

        searchQuery,
        setSearchQuery,
    };
}
