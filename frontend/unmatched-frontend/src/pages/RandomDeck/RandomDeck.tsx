import React, { useState } from "react";
import { getRandom } from "../../api/deck";
import { DeckDto } from "../../types/deck";
import "./RandomDeck.css";

export default function RandomDeck() {
    const [decks, setDecks] = useState<DeckDto[]>([]);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState<string | null>(null);
    const [quantity, setQuantity] = useState<number>(1);

    const fetchRandomDecks = async () => {
        setLoading(true);
        setError(null);
        try {
            const data = await getRandom(quantity);
            setDecks(data);
        } catch (e: any) {
            setError(e.message || "Something went wrong");
        } finally {
            setLoading(false);
        }
    };

    return (
        <div className="random-deck-container">
            <h1 className="random-deck-title">Random Decks</h1>

            <div className="random-deck-controls">
                <input
                    type="text"
                    value={quantity}
                    onChange={(e) => setQuantity(Number(e.target.value))}
                    className="random-deck-input"
                />
                <button
                    onClick={fetchRandomDecks}
                    className="random-deck-button"
                >
                    Get
                </button>
            </div>

            {loading && <p>Loading...</p>}
            {error && <p className="random-deck-error">{error}</p>}

            <div className="random-deck-grid">
                {decks.map((deck) => (
                    <div key={deck.name} className="random-deck-card">
                        <h2 className="random-deck-card-title">{deck.name}</h2>
                    </div>
                ))}
            </div>
        </div>
    );
}
