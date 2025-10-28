import React from 'react';
import {Link} from 'react-router-dom';
import {FaUsers} from 'react-icons/fa';
import {getAll} from '../../api/umdbDeck';
import {AttackType, DeckDto} from '../../types/deck';
import './Decks.css';
import {ContentPage} from "../../components/ContentPage/ContentPage";

function attackTypeLabel(type: AttackType) {
    return type.toLowerCase();
}

function DeckCardRenderer({deck}: { deck: DeckDto }) {
    const [imgError, setImgError] = React.useState(false);

    return (
        <article aria-label={deck.name}>
            <Link to={`/decks/${encodeURIComponent(deck.name)}`} className="card-item-link" title={deck.name}>

                <div className="card-item-art" aria-hidden>
                    {deck.artImageUrl && !imgError ? (
                        <img
                            src={deck.artImageUrl}
                            alt={deck.name}
                            onError={() => setImgError(true)}
                        />
                    ) : (
                        <div className="card-item-art-fallback">Deadpool will return image soon</div>
                    )}
                </div>

                <div className="card-item-footer">
                    <div className="card-item-header">
                        <div className="card-item-title">
                            {deck.name}
                        </div>

                        {deck.hero.quantity > 1 && (
                            <div className="hero-quantity">
                                <FaUsers className="quantity-icon"/>
                                <span>x{deck.hero.quantity}</span>
                            </div>
                        )}
                    </div>

                    <div className="card-item-stats">
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
    const sortOptions = [
        {label: '— none —', value: ''},
        {label: 'Deck name', value: 'name'},
        {label: 'Attack type', value: 'hero.attackType'},
        {label: 'Quantity', value: 'hero.quantity'},
        {label: 'HP', value: 'hero.hp'},
        {label: 'Move', value: 'hero.move'},
    ];

    return (
        <ContentPage<DeckDto>
            title="Decks"
            fetchFn={getAll}
            sortOptions={sortOptions.filter(o => o.value)}
            keyExtractor={deck => deck.name}
            renderCard={deck => <DeckCardRenderer deck={deck}/>}
            searchFields={['name']}
        />
    );
}
