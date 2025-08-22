import React from 'react';
import {Link} from 'react-router-dom';
import {FaUsers} from 'react-icons/fa';
import {useClientTable} from '../../hooks/useClientTable/useClientTable';
import {getAll} from '../../api/deck';
import {AttackType, DeckDto} from '../../types/deck';
import {Card} from '../../components/Card/Card';
import {SortPanel} from '../../components/SortPanel/SortPanel';
import './Decks.css';

function attackTypeLabel(type: AttackType) {
    return type.toLowerCase();
}

function DeckCardRenderer({deck}: { deck: DeckDto }) {
    const [imgError, setImgError] = React.useState(false);

    return (
        <article className="deck-card" aria-label={deck.name}>
            <Link to={`/decks/${encodeURIComponent(deck.name)}`} className="deck-link" title={deck.name}>
                <div className="deck-art" aria-hidden>
                    {deck.artImageUrl && !imgError ? (
                        <img
                            src={deck.artImageUrl}
                            alt={deck.name}
                            onError={() => setImgError(true)}
                        />
                    ) : (
                        <div className="deck-art-fallback">Deadpool will return image soon</div>
                    )}
                </div>

                <div className="deck-footer">
                    <div className="deck-hero-header">
                        <div className="deck-hero-name">
                            {deck.name}
                        </div>

                        {deck.hero.quantity > 1 && (
                            <div className="hero-quantity">
                                <FaUsers className="quantity-icon"/>
                                <span>x{deck.hero.quantity}</span>
                            </div>
                        )}
                    </div>

                    <div className="deck-stats-row">
                        <div className="stat hp">
                            <span className="hp-heart">❤</span>
                            <span>{deck.hero.hp}</span>
                        </div>

                        <div className="stat attack">
                            <img
                                className="attack-icon-short"
                                src={`/attack_type_short/${attackTypeLabel(deck.hero.attackType)}.png`}
                                alt={attackTypeLabel(deck.hero.attackType)}
                            />
                        </div>

                        <div className="stat move">
                            <div className="move-label">↕</div>
                            <div className="move-value">{deck.hero.move}</div>
                        </div>
                    </div>
                </div>
            </Link>
        </article>
    );
}

export default function Decks() {
    const {data: decks = [], loading, error, sortState, onSort} = useClientTable<DeckDto>(getAll);

    const sortOptions = [
        {label: '— none —', value: ''},
        {label: 'Deck name', value: 'name'},
        {label: 'Attack type', value: 'hero.attackType'},
        {label: 'Quantity', value: 'hero.quantity'},
        {label: 'HP', value: 'hero.hp'},
        {label: 'Move', value: 'hero.move'},
    ];

    return (
        <div className="decks-page">
            <div className="decks-container">
                <h1 className="decks-title">Decks</h1>

                <SortPanel options={sortOptions.filter(o => o.value)} sortState={sortState} onSort={onSort}/>

                {loading && <p className="decks-status">Loading decks…</p>}
                {error && <p className="decks-status error">{error}</p>}
                {!loading && !error && decks.length === 0 && <p className="decks-status">No decks available.</p>}

                <div className="decks-grid">
                    {decks.map(deck => (
                        <Card
                            key={deck.name}
                            data={deck}
                            className="deck-card-wrapper"
                            renderContent={(d) => <DeckCardRenderer deck={d as DeckDto}/>}
                        />
                    ))}
                </div>
            </div>
        </div>
    );
}
