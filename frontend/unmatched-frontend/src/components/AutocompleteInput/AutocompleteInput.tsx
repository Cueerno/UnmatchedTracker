import React, {FC, KeyboardEvent, useEffect, useRef, useState,} from 'react';
import './AutocompleteInput.css';

interface AutocompleteInputProps {
    value: string;
    onChange: (val: string) => void;
    fetchOptions: () => Promise<string[]>;
    placeholder?: string;
}

export const AutocompleteInput: FC<AutocompleteInputProps> = ({
                                                                  value,
                                                                  onChange,
                                                                  fetchOptions,
                                                                  placeholder = '',
                                                              }) => {
    const [options, setOptions] = useState<string[]>([]);
    const [filtered, setFiltered] = useState<string[]>([]);
    const [open, setOpen] = useState(false);
    const [highlightedIndex, setHighlightedIndex] = useState(-1);

    const containerRef = useRef<HTMLDivElement>(null);

    useEffect(() => {
        fetchOptions().then(setOptions).catch(console.error);
    }, [fetchOptions]);

    useEffect(() => {
        if (!value) {
            setFiltered([]);
            setHighlightedIndex(-1);
            return;
        }
        const lower = value.trim().toLowerCase();
        const result = options.filter(opt =>
            opt.toLowerCase().split(/\s+/).some(w => w.startsWith(lower))
        );
        setFiltered(result);
        setHighlightedIndex(result.length > 0 ? 0 : -1);
    }, [value, options]);

    useEffect(() => {
        const onClickOutside = (e: MouseEvent) => {
            if (
                containerRef.current &&
                !containerRef.current.contains(e.target as Node)
            ) {
                setOpen(false);
                setHighlightedIndex(-1);
            }
        };
        document.addEventListener('mousedown', onClickOutside);
        return () => document.removeEventListener('mousedown', onClickOutside);
    }, []);

    useEffect(() => {
        if (!open || highlightedIndex < 0) return;
        const container = containerRef.current;
        if (!container) return;

        const active = container.querySelector<HTMLLIElement>(
            '.autocomplete-suggestion.active'
        );
        if (active) {
            active.scrollIntoView({block: 'nearest'});
        }
    }, [highlightedIndex, open]);

    const handleKeyDown = (e: KeyboardEvent<HTMLInputElement>) => {
        if (!open || filtered.length === 0) return;

        switch (e.key) {
            case 'ArrowDown':
                e.preventDefault();
                setHighlightedIndex(i =>
                    i < filtered.length - 1 ? i + 1 : i
                );
                break;
            case 'ArrowUp':
                e.preventDefault();
                setHighlightedIndex(i =>
                    i > 0 ? i - 1 : i
                );
                break;
            case 'Enter':
                e.preventDefault();
                if (highlightedIndex >= 0) {
                    onChange(filtered[highlightedIndex]);
                }
                setOpen(false);
                break;
            case 'Escape':
                e.preventDefault();
                setOpen(false);
                break;
        }
    };

    return (
        <div className="autocomplete-container" ref={containerRef}>
            <input
                type="text"
                className="form-input"
                placeholder={placeholder}
                value={value}
                onChange={e => {
                    onChange(e.target.value);
                    setOpen(true);
                }}
                onFocus={() => setOpen(true)}
                onKeyDown={handleKeyDown}
            />

            {open && filtered.length > 0 && (
                <ul className="autocomplete-suggestions">
                    {filtered.map((opt, idx) => (
                        <li
                            key={opt}
                            className={
                                'autocomplete-suggestion' +
                                (idx === highlightedIndex ? ' active' : '')
                            }
                            onMouseEnter={() => setHighlightedIndex(idx)}
                            onClick={() => {
                                onChange(opt);
                                setOpen(false);
                            }}
                        >
                            {opt}
                        </li>
                    ))}
                </ul>
            )}
        </div>
    );
};
