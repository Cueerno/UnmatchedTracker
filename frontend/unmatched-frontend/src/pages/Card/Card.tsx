import React, {useEffect, useState} from "react";
import {getByTitle} from "../../api/card";
import {useParams} from "react-router-dom";
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

    if (loading)  return <div>Loading card…</div>;
    if (error)    return <div style={{ color: "red" }}>Error: {error}</div>;
    if (!card)    return <div>No card data</div>;

    return (
        <div>
            <p>{card.title}</p>
            <img
                className="card-icon"
                src={`/card_type/${cardTypeLabel(card.type)}.png`}
                alt={cardTypeLabel(card.type)}

                style={{
                    width: '150px',
                    height: 'auto',
                    background: "black"
                }}
                />
            <p>{card.value}</p>
        </div>
    );
}
