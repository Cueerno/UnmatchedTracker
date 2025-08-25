import React, {useEffect, useState} from 'react';
import {useParams} from 'react-router-dom';
import {getByName} from '../../api/deck';
import {AttackType, CardDto, DeckDto, ExtraCharacterDto, HeroDto, RuleCardDto, SidekickDto,} from '../../types/deck';
import './Deck.css';

/** Простая обёртка для изображений с fallback (реактивно). */
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
        return <div className={`${className ?? ''} image-fallback`}>{fallback ?? <span>No image</span>}</div>;
    }
    return (
        // eslint-disable-next-line jsx-a11y/img-redundant-alt
        <img src={src} alt={alt ?? 'image'} className={className} onError={() => setErr(true)} loading="lazy"/>
    );
}

export default function Deck() {
    const {name} = useParams<{ name: string }>();
    const [deck, setDeck] = useState<DeckDto | null>(null);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState<string | null>(null);

    useEffect(() => {
        if (!name) return;
        setLoading(true);
        getByName(name)
            .then((data) => setDeck(data))
            .catch((e) => setError(e?.message ?? 'Loading error'))
            .finally(() => setLoading(false));
    }, [name]);

    const attackTypeLabel = (t?: AttackType) => (t ? String(t).toLowerCase() : 'unknown');

    if (loading) return <p className="deck-loading">Loading...</p>;
    if (error) return <p className="deck-error">{error}</p>;
    if (!deck) return null;

    return (
        <div className="deck-page">
            <div className="deck-inner">
                {/* Top grid: art | details | stacked images */}
                <div className="deck-top-grid">
                    {/* LEFT: big 1:1 art */}
                    <div className="deck-art-col">
                        {/*<ImageWithFallback*/}
                        {/*    src={deck.artImageUrl}*/}
                        {/*    alt={`${deck.name} art`}*/}
                        {/*    className="deck-art-image"*/}
                        {/*    fallback={<div className="deck-art-placeholder">Artwork</div>}*/}
                        {/*/>*/}

                        {/* Compact front/back thumbnails for smaller screens */}
                        <div className="deck-front-back-compact">
                            <ImageWithFallback src={deck.frontImageUrl} alt="front" className="deck-front-thumb"
                                               fallback={<div className="thumb-fallback">Front</div>}/>
                            <ImageWithFallback src={deck.backImageUrl} alt="back" className="deck-back-thumb"
                                               fallback={<div className="thumb-fallback">Back</div>}/>
                        </div>
                    </div>

                    {/* CENTER: title, hero block, rule cards, extras, sidekick */}
                    <div className="deck-details-col">
                        <header className="deck-header">
                            <div className="deck-title-block">
                                <h1 className="deck-title">{deck.name}</h1>
                                <div className="deck-set">from {deck.setName}</div>
                                {deck.quote && <div className="deck-quote">“{deck.quote}”</div>}
                                {deck.notes && <div className="deck-notes">{deck.notes}</div>}
                            </div>

                            <div className="deck-meta">
                                {/* можно разместить дополнительные метаданные сюда */}
                            </div>
                        </header>

                        {/* HERO */}
                        <section className="hero-section">
                            <div className="hero-card">
                                <div className="hero-left">
                                    <ImageWithFallback
                                        src={(deck.hero as HeroDto).imageUrl}
                                        alt={`${deck.hero.name} portrait`}
                                        className="hero-figure"
                                        fallback={<div className="figure-fallback">No portrait</div>}
                                    />
                                </div>

                                <div className="hero-right">
                                    <h2 className="hero-name">
                                        {deck.hero.name}
                                        {deck.hero.quantity > 1 &&
                                            <span className="hero-qty"> ×{deck.hero.quantity}</span>}
                                    </h2>

                                    <div className="hero-stats-row">
                                        <div className="stats-left">
                                            {deck.hero.quantity > 1 && (
                                                <div className="stat qty">
                                                    <span className="qty-icon" aria-hidden>👥</span>
                                                    <span className="qty-value">x{deck.hero.quantity}</span>
                                                </div>
                                            )}
                                            <div className="stat hp">
                                                <span className="hp-heart" aria-hidden>❤</span>
                                                <span className="hp-value">{deck.hero.hp}</span>
                                            </div>
                                        </div>

                                        <div className="stat attack">
                                            <ImageWithFallback
                                                src={`/attack_type/${attackTypeLabel(deck.hero.attackType)}.png`}
                                                alt={attackTypeLabel(deck.hero.attackType)}
                                                className="attack-type-img"
                                                fallback={<div className="attack-fallback">—</div>}
                                            />
                                        </div>

                                        <div className="stat move">
                                            <div className="move-label" aria-hidden>↕</div>
                                            <div className="move-value">{deck.hero.move}</div>
                                        </div>
                                    </div>

                                    {deck.hero.specialAbility &&
                                        <p className="hero-ability">{deck.hero.specialAbility}</p>}
                                </div>
                            </div>
                        </section>

                        {/* RULE CARDS */}
                        {deck.ruleCards && deck.ruleCards.length > 0 && (
                            <section className="rule-cards">
                                <h3 className="section-title">Rule cards</h3>
                                <div className="rule-cards-grid">
                                    {deck.ruleCards.map((rc: RuleCardDto) => (
                                        <div key={rc.title ?? rc.imageUrl} className="rule-card">
                                            <ImageWithFallback src={rc.imageUrl} alt={rc.title}
                                                               className="rule-card-image"
                                                               fallback={<div className="rule-card-noimage">No
                                                                   image</div>}/>
                                            <div className="rule-card-name">{rc.title}</div>
                                            {rc.text && <div className="rule-card-text">{rc.text}</div>}
                                        </div>
                                    ))}
                                </div>
                            </section>
                        )}

                        {/* EXTRA CHARACTERS */}
                        {deck.extraCharacters && deck.extraCharacters.length > 0 && (
                            <section className="extra-characters">
                                <h3 className="section-title">Extra characters</h3>
                                <div className="extra-grid">
                                    {deck.extraCharacters.map((ex: ExtraCharacterDto) => (
                                        <div key={ex.name} className="extra-item">
                                            <ImageWithFallback src={ex.imageUrl} alt={ex.name} className="extra-image"
                                                               fallback={<div className="figure-fallback">No
                                                                   image</div>}/>
                                            <div className="extra-info">
                                                <div className="extra-name">{ex.name}{ex.quantity > 1 &&
                                                    <span className="hero-qty"> ×{ex.quantity}</span>}</div>
                                                <div className="small-stats">HP: {ex.hp} · Move: {ex.move}</div>
                                            </div>
                                        </div>
                                    ))}
                                </div>
                            </section>
                        )}

                        {/* SIDEKICK */}
                        {deck.sidekick && (
                            <section className="sidekick-section">
                                <h3 className="section-title">Sidekick</h3>
                                <div className="sidekick-card">
                                    <ImageWithFallback src={(deck.sidekick as SidekickDto).imageUrl}
                                                       alt={deck.sidekick.name} className="sidekick-image"
                                                       fallback={<div className="figure-fallback">No image</div>}/>
                                    <div className="sidekick-info">
                                        <div
                                            className="sidekick-name">{deck.sidekick.name}{deck.sidekick.quantity > 1 &&
                                            <span className="hero-qty"> ×{deck.sidekick.quantity}</span>}</div>
                                        <div className="small-stats">HP: {deck.sidekick.hp} ·
                                            Move: {deck.sidekick.move}</div>
                                        <div className="sidekick-attack">
                                            <ImageWithFallback
                                                src={`/attack_type/${attackTypeLabel(deck.sidekick.attackType)}.png`}
                                                alt="sidekick attack" className="attack-type-img-sm"
                                                fallback={<div className="attack-fallback">—</div>}/>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        )}
                    </div>

                    {/* RIGHT: stacked images: figure, front, back */}
                    <aside className="deck-images-col">
                        <div className="stacked-images">
                            <ImageWithFallback src={deck.frontImageUrl} alt="front" className="stacked-front"
                                               fallback={<div className="thumb-fallback">Front</div>}/>
                            <ImageWithFallback src={deck.backImageUrl} alt="back" className="stacked-back"
                                               fallback={<div className="thumb-fallback">Back</div>}/>
                        </div>
                    </aside>
                </div>

                {/* CARDS LIST */}
                <section className="cards-section">
                    <h3 className="section-title">Deck cards</h3>
                    <div className="cards-container">
                        {deck.cards && deck.cards.length > 0 ? (
                            deck.cards.map((c: CardDto, idx: number) => (
                                <div key={c.title ?? idx} className="card-item">
                                    <div className="card-title">{c.title ?? `Card ${idx + 1}`} <span
                                        className="card-title">x{c.quantity}</span></div>
                                    <ImageWithFallback src={c.imageUrl} alt={c.title} className="card-image"
                                                       fallback={<div className="card-noimage">No image</div>}/>
                                    <div className="card-meta">
                                        {c.type !== 'SCHEME'
                                            ? <div className="card-values">Value: {c.value} · Boost: {c.boost}</div>
                                            : <div className="card-values">Boost: {c.boost}</div>
                                        }
                                    </div>
                                </div>
                            ))
                        ) : (
                            <div className="no-cards">No cards available</div>
                        )}
                    </div>
                </section>
            </div>
        </div>
    );
}
