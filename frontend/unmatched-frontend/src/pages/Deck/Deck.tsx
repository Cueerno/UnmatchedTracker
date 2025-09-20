import React, {useEffect, useMemo, useState} from "react";
import {useParams} from "react-router-dom";
import {getByName} from "../../api/deck";
import {AttackType, DeckCardDto, DeckWithCardsDto, ExtraCharacterDto, RuleCardDto} from "../../types/deck";
import {SortPanel} from "../../components/SortPanel/SortPanel";
import "./Deck.css";

function ImageWithFallback({
                               src,
                               alt,
                               className,
                               fallback,
                           }: {
    src?: string | null;
    alt?: string;
    className?: string;
    fallback?: React.ReactNode;
}) {
    const [err, setErr] = useState(false);
    if (!src || err) {
        return <div className={`${className ?? ""} image-fallback`}>{fallback ?? <span>No image</span>}</div>;
    }
    return <img src={src} alt={alt ?? ""} className={className} onError={() => setErr(true)} loading="lazy"/>;
}

function attackTypeLabel(t?: AttackType) {
    return t ? String(t).toLowerCase() : "unknown";
}

/* Sorting helpers (same as before) */
type Direction = "asc" | "desc";
type SortState = { sortBy?: string; direction?: Direction };

function sortCardsBy(cards: DeckCardDto[], sortBy?: string, direction: Direction = "asc") {
    if (!sortBy || sortBy === "" || sortBy === "default") return cards;
    const cmp = (a: DeckCardDto, b: DeckCardDto) => {
        if (sortBy === "card.title") return (a.card.title || "").localeCompare(b.card.title || "");
        if (sortBy === "card.type") return String(a.card.type).localeCompare(String(b.card.type));
        if (sortBy === "quantity") return (a.quantity || 0) - (b.quantity || 0);
        return 0;
    };
    const arr = [...cards].sort(cmp);
    if (direction === "desc") arr.reverse();
    return arr;
}

export default function Deck() {
    const {name} = useParams<{ name: string }>();
    const [deck, setDeck] = useState<DeckWithCardsDto | null>(null);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState<string | null>(null);

    const [sortState, setSortState] = useState<SortState>({sortBy: undefined, direction: "asc"});

    useEffect(() => {
        if (!name) return;
        setLoading(true);
        getByName(name)
            .then((data) => setDeck(data))
            .catch((e) => setError(e?.message ?? "Loading error"))
            .finally(() => setLoading(false));
    }, [name]);

    const onSort = (field?: string) => {
        if (!field) {
            setSortState({sortBy: undefined, direction: "asc"});
            return;
        }
        setSortState((prev) => {
            if (prev.sortBy === field) {
                return {sortBy: field, direction: prev.direction === "asc" ? "desc" : "asc"};
            }
            return {sortBy: field, direction: "asc"};
        });
    };

    const sortOptions = [
        {label: "— none —", value: ""},
        {label: "Title", value: "card.title"},
        {label: "Type", value: "card.type"},
        {label: "Quantity", value: "quantity"},
    ];

    const sortedCards = useMemo(() => {
        if (!deck?.cards) return [];
        return sortCardsBy(deck.cards, sortState.sortBy, sortState.direction ?? "asc");
    }, [deck?.cards, sortState]);

    if (loading) return <p className="deck-loading">Loading...</p>;
    if (error) return <p className="deck-error">{error}</p>;
    if (!deck) return null;

    return (
        <div className="deck-page deck-dark">
            <div className="deck-inner">
                <div className="deck-top-grid">
                    <div className="deck-left-col">
                        <div className="deck-header">
                            <div className="deck-title-block">
                                <h1 className="deck-title">{deck.name}</h1>
                                <div className="deck-set">from {deck.setName}</div>
                                {deck.quote && <div className="deck-quote">“{deck.quote}”</div>}
                                {deck.notes && <div className="deck-notes">{deck.notes}</div>}
                            </div>
                        </div>

                        <section className="hero-summary">
                            <div className="hero-name-large">
                                {deck.hero.name}

                                {deck.hero.quantity > 1 && (
                                    <span className="hero-qty"> x{deck.hero.quantity}</span>
                                )}
                            </div>

                            {/* Special ability — less prominent */}
                            <div className="hero-special-label">Special ability</div>
                            <div className="hero-special small-muted">{deck.hero.specialAbility}</div>

                            {/* compact horizontal stats */}
                            <div className="hero-line-stats">
                                <div className="stat-pill hp">
                                    <span className="stat-label">❤️</span>
                                    <span className="stat-value">{deck.hero.hp}</span>
                                </div>

                                <div className="stat-pill attack">
                                    <img
                                        src={`/attack_type/${attackTypeLabel(deck.hero.attackType)}.png`}
                                        alt={attackTypeLabel(deck.hero.attackType)}
                                        className="stat-attack-img"
                                    />
                                </div>

                                <div className="stat-pill move">
                                    <span className="stat-label">Move</span>
                                    <span className="stat-value">{deck.hero.move}</span>
                                </div>
                            </div>
                        </section>

                        {deck.extraCharacters && deck.extraCharacters.length > 0 && (
                            <section className="extra-section">
                                {deck.extraCharacters.map((ex: ExtraCharacterDto) => (
                                    <div className="extra-row" key={ex.name}>
                                        <div className="extra-title">{ex.name}</div>
                                        <div className="extra-stats small-muted">
                                            ❤️: {ex.hp} · :{" "}
                                            <img
                                                src={`/attack_type/${attackTypeLabel(ex.attackType)}.png`}
                                                alt={ex.attackType}
                                                className="tiny-attack"
                                            />{" "}
                                            · Move: {ex.move}
                                        </div>
                                        {ex.specialAbility &&
                                            <div className="extra-ability small-muted">{ex.specialAbility}</div>}
                                    </div>
                                ))}
                            </section>
                        )}

                        {deck.sidekick && (
                            <section className="sidekick-section-compact">
                                <div className="sidekick-title">Sidekick</div>
                                <div className="sidekick-row">
                                    <ImageWithFallback
                                        src={deck.sidekick.imageUrl}
                                        alt={deck.sidekick.name}
                                        className="sidekick-thumb"
                                        fallback={<div className="figure-fallback">No image</div>}
                                    />
                                    <div className="sidekick-info-compact">
                                        <div className="sidekick-name">
                                            {deck.sidekick.name}
                                            {deck.sidekick.quantity > 1 &&
                                                <span className="hero-qty"> ×{deck.sidekick.quantity}</span>}
                                        </div>
                                        <div className="small-stats">❤️: {deck.sidekick.hp} ·
                                            Move: {deck.sidekick.move}</div>
                                        <div className="small-attack">
                                            <img
                                                src={`/attack_type/${attackTypeLabel(deck.sidekick.attackType)}.png`}
                                                alt="attack"
                                                className="tiny-attack"
                                            />
                                        </div>
                                    </div>
                                </div>
                            </section>
                        )}
                    </div>

                    <aside className="deck-right-col">
                        <div className="right-images-row">
                            <div className="right-figure">
                                <ImageWithFallback
                                    src={deck.hero.imageUrl}
                                    alt="figure"
                                    className="right-figure-img"
                                    fallback={<div className="figure-fallback">Figure</div>}
                                />
                            </div>

                            <div className="right-back">
                                <ImageWithFallback
                                    src={deck.backImageUrl}
                                    alt="back"
                                    className="right-back-img"
                                    fallback={<div className="thumb-fallback">Back</div>}
                                />
                            </div>
                        </div>

                        {/* rulecards */}
                        {deck.ruleCards && deck.ruleCards.length > 0 && (
                            <div className="rulecards-block">
                                <div className="rulecards-title">Rule cards</div>
                                <div className="rulecards-inner">
                                    {deck.ruleCards.map((rc: RuleCardDto) => (
                                        <div key={rc.title} className="rulecard-tile">
                                            <ImageWithFallback src={rc.imageUrl} alt={rc.title}
                                                               className="rulecard-image"
                                                               fallback={<div className="rulecard-noimage">No</div>}/>
                                            <div className="rulecard-title">{rc.title}</div>
                                        </div>
                                    ))}
                                </div>
                            </div>
                        )}
                    </aside>
                </div>

                {/* SortPanel — wired to external sorting */}
                <div className="sort-panel-wrapper">
                    <SortPanel options={sortOptions.filter((o) => o.value)} sortState={sortState} onSort={onSort}/>
                </div>

                {/* Cards grid */}
                <section className="cards-section">
                    <div className="cards-grid">
                        {sortedCards && sortedCards.length > 0 ? (
                            sortedCards.map((dc: DeckCardDto, idx: number) => (
                                // <div className="card-tile" key={`${dc.card.title}-${idx}`}>
                                //     <div className="card-image-wrap">
                                //         <ImageWithFallback src={dc.imageUrl} alt={dc.card.title} className="card-thumb"
                                //                            fallback={<div className="card-noimage">No image</div>}/>
                                //     </div>
                                //     <div className="card-meta">
                                //         <div className="card-title">{dc.card.title}</div>
                                //         <div className="card-sub">Type: {dc.card.type}</div>
                                //         <div className="card-sub">Qty: {dc.quantity} · Boost: {dc.boost}</div>
                                //         {dc.card.effect && <div className="card-effect">{dc.card.effect}</div>}
                                //     </div>
                                // </div>

                                <div className="deck-card">
                                    <div className="deck-card-header">
                                        <span className="title">{dc.card.title}</span>
                                        <span className={`cost cost-${dc.card.type.toLowerCase()}`}>
                                        <img
                                            className="card-icon"
                                            src={`/card_type/${dc.card.type.toLowerCase()}.png`}
                                            alt={dc.card.type.toLowerCase()}
                                        />
                                        <span className="cost-value">{dc.card.value}</span>
                                    </span>
                                    </div>

                                    <div className="card-body">
                                        <div className="ability">
                                            <span className="ability-name">{dc.card.effect}</span>
                                        </div>
                                    </div>

                                    <div className="deck-card-footer">
                                        <span className="subtext">{dc.characterName}</span>
                                        <span className="qty">x{dc.quantity ?? 1}</span>
                                    </div>
                                </div>
                            ))
                        ) : (
                            <div className="no-cards">No cards</div>
                        )}
                    </div>
                </section>
            </div>
        </div>
    );
}
