import React from "react";
import {CardDto, CardType} from "../../types/card";
import {ContentPage} from "../../components/ContentPage/ContentPage";
import {getAll} from "../../api/card";
import {Link} from "react-router-dom";

function cardTypeLabel(type: CardType) {
    return type.toLowerCase();
}


function CardCardRenderer({card}: { card: CardDto }) {
    return (
        <article aria-label={card.title}>
            <Link to={`/cards/${encodeURIComponent(card.title.concat(card.characterName))}`} className="card-link" title={card.title}>

                <div className="card-footer">
                    <div className="card-header">
                        <div className="card-title">
                            {card.title}
                        </div>
                    </div>

                    <div className="card-stat">
                        <div className="stat type">
                            <img
                                className="card-icon"
                                src={`/card_type/${cardTypeLabel(card.type)}.png`}
                                alt={cardTypeLabel(card.type)}
                            />
                        </div>

                        <div className="stat value">
                            <span>{card.value}</span>
                        </div>
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
