import React from "react";
import {CardDto} from "../../types/card";
import {ContentPage} from "../../components/ContentPage/ContentPage";
import {getAll} from "../../api/card";
import {Link} from "react-router-dom";
import "./Cards.css"

function CardCardRenderer({card}: { card: CardDto }) {
    const typeKey = card.type.toLowerCase();

    return (
        <article aria-label={card.title}>
            <Link to={`/cards/${encodeURIComponent(card.title)}`} className="card-item-link" title={card.title}>
                <div className="deck-card-header">
                    <span className="title">{card.title}</span>
                    <span className={`cost type-${typeKey}`}>
                    <img
                        className="card-icon"
                        src={`/card_type/${typeKey}.png`}
                        alt={typeKey}
                    />
                    <span className="card-value">{card.value}</span>
                    </span>
                </div>

                <div className="card-body">
                    <div className="card-effect">
                        <span className="effect">{card.effect}</span>
                    </div>
                </div>
            </Link>
        </article>
    )
}

export default function Cards() {
    const sortOptions = [
        {label: '— none —', value: ''},
        {label: 'Title', value: 'title'},
        {label: 'Type', value: 'type'},
        {label: 'Value', value: 'value'},
    ];

    return (
        <ContentPage<CardDto>
            title={"Cards"}
            fetchFn={getAll}
            sortOptions={sortOptions.filter(o => o.value)}
            renderCard={card => <CardCardRenderer card={card}/>}
            keyExtractor={card => card.title}
        />
    );
}
