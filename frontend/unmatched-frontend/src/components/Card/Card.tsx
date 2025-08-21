import React from 'react';
import './Card.css';

interface CardProps<T> {
    data: T;
    renderContent: (item: T) => React.ReactNode;
    className?: string;
    wrapper?: ((children: React.ReactNode, item: T) => React.ReactNode) | string;
}

export function Card<T>({ data, renderContent, className = '', wrapper }: CardProps<T>) {
    const content = <div className={`card ${className}`.trim()} role="group">{renderContent(data)}</div>;

    if (!wrapper) return content;

    if (typeof wrapper === 'string') {
        return <a href={wrapper} className="card-link" aria-label="card-link">{content}</a>;
    }

    return <>{wrapper(content, data)}</>;
}
