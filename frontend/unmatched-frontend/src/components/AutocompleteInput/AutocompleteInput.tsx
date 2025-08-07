import React, {useEffect, useRef, useState} from 'react';
import './AutocompleteInput.css';

interface AutocompleteInputProps {
    value: string;
    onChange: (val: string) => void;
    fetchOptions: () => Promise<string[]>;
    placeholder?: string;
}

export const AutocompleteInput: React.FC<AutocompleteInputProps> = ({
                                                                        value,
                                                                        onChange,
                                                                        fetchOptions,
                                                                        placeholder = '',
                                                                    }) => {
    const [options, setOptions] = useState<string[]>([]);
    const [filtered, setFiltered] = useState<string[]>([]);
    const [open, setOpen] = useState(false);
    const containerRef = useRef<HTMLDivElement>(null);

    useEffect(() => {
        fetchOptions()
            .then(setOptions)
            .catch(console.error);
    }, [fetchOptions]);

    useEffect(() => {
        if (!value) {
            setFiltered([]);
            return;
        }
        const lower = value.trim().toLowerCase();
        const result = options.filter(opt => {
            return opt
                .toLowerCase()
                .split(/\s+/)
                .some(word => word.startsWith(lower));
        });
        setFiltered(result);
    }, [value, options]);

    useEffect(() => {
        const onClick = (e: MouseEvent) => {
            if (
                containerRef.current &&
                !containerRef.current.contains(e.target as Node)
            ) {
                setOpen(false);
            }
        };
        document.addEventListener('mousedown', onClick);
        return () => document.removeEventListener('mousedown', onClick);
    }, []);

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
            />

            {open && filtered.length > 0 && (
                <ul className="autocomplete-suggestions">
                    {filtered.map(opt => (
                        <li
                            key={opt}
                            className="autocomplete-suggestion"
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
