import React from "react";
import "./CardComponent.css";
import {CardWithDecksDto} from "../../types/card";

export interface DeckCardProps extends CardWithDecksDto {
    showFooter?: boolean;
}

export function CardComponent({
                                  title,
                                  value,
                                  type,
                                  effect,
                                  showFooter,
                                  decks
                                 }: DeckCardProps) {
    const typeKey = type.toLowerCase();

    return (
        <div className="deck-card">
            <div className="deck-card-header">
                <span className="title">{title}</span>
                <span className={`cost cost-${typeKey}`}>
                    <img
                        className="card-icon"
                        src={`/card_type/${typeKey}.png`}
                        alt={typeKey}
                    />
                    <span className="cost-value">{value}</span>
                </span>
            </div>

            <div className="card-body">
                <div className="ability">
                    <span className="ability-name">{effect}</span>
                </div>
            </div>

            {showFooter && (
                <div className="card-item">
                    {/*<span className="subtext">{decks.characterName}</span>*/}
                    {/*<span className="qty">x{decks.quantity ?? 1}</span>*/}
                </div>
            )}
        </div>
    );
}