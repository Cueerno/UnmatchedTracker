import React, {useEffect, useState} from "react";
import {getByTitle} from "../../api/card";
import {Link, useParams} from "react-router-dom";
import {CardType, CardWithDecksDto} from "../../types/card";

function cardTypeLabel(type: CardType) {
    return type.toLowerCase();
}


export default function Card() {
    const {title} = useParams<{ title: string }>();
    const [card, setCard] = useState<CardWithDecksDto | null>(null);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState<string | null>(null);

    useEffect(() => {
        if (!title) return;
        setLoading(true);
        getByTitle(title)
            .then((data) => setCard(data))
            .catch((e) => setError(e?.message ?? "Loading error"))
            .finally(() => setLoading(false));
    }, [title]);

    if (loading) return <div>Loading card…</div>;
    if (error) return <div style={{color: "red"}}>Error: {error}</div>;
    if (!card) return <div>No card data</div>;

    return (
        <div>
            <div className="deck-card-header">
                <span className="title">{card.title}</span>
                <span className={`cost type-${cardTypeLabel(card.type)}`}>
                    <img
                        className="card-icon"
                        src={`/card_type/${cardTypeLabel(card.type)}.png`}
                        alt={cardTypeLabel(card.type)}
                    />
                    <span className="card-value">{card.value}</span>
                    </span>
            </div>

            <div className="card-body">
                <div className="card-effect">
                    <span className="effect">{card.effect}</span>
                </div>
            </div>

            <div>
                <h3>Decks with this card:</h3>
                {card.decks.length === 0 && <p>No decks found</p>}
                <ul style={{listStyle: "none", padding: 0}}>
                    {card.decks.map((deck, i) => (
                        <Link to={`/decks/${encodeURIComponent(deck.deckName)}`} className="card-item-link"
                              title={deck.deckName}>
                            <li
                                key={i}
                                style={{
                                    border: "1px solid #ccc",
                                    borderRadius: "8px",
                                    margin: "10px 0",
                                    padding: "10px",
                                    display: "flex",
                                    alignItems: "center",
                                    gap: "15px"
                                }}
                            >
                                <img
                                    src={deck.imageUrl}
                                    alt={deck.deckName}
                                    style={{width: "100px", height: "auto", borderRadius: "4px"}}
                                />
                                <div>
                                    <p><strong>Deck:</strong> {deck.deckName}</p>
                                    <p><strong>Character:</strong> {deck.characterName}</p>
                                    <p><strong>Boost:</strong> {deck.boost}</p>
                                    <p><strong>Quantity:</strong> {deck.quantity}</p>
                                </div>
                            </li>
                        </Link>
                    ))}
                </ul>
            </div>
        </div>
    );
}
