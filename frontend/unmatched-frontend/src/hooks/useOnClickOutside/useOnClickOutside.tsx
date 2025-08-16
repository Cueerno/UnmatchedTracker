import {RefObject, useEffect} from 'react';

export default function useOnClickOutside(
    ref: RefObject<HTMLElement | null>,
    handler: (e: MouseEvent) => void
) {
    useEffect(() => {
        const listener = (e: MouseEvent) => {
            if (!ref.current || ref.current.contains(e.target as Node)) return;
            handler(e);
        };
        document.addEventListener('mousedown', listener);
        return () => document.removeEventListener('mousedown', listener);
    }, [ref, handler]);
}
