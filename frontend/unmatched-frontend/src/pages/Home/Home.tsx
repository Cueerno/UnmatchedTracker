import React, {useEffect, useState} from 'react';
import {ReactComponent as DeadpoolMask} from '../../assets/deadpool-logo.svg';
import {ReactComponent as UnmatchedLogo} from '../../assets/unmatched-logo.svg';
import {getDashboard} from '../../api/dashboard';
import './Home.css';
import './HomeCards.css';
import {HomeDashboardDto} from '../../types/dashboard';
import {Link} from 'react-router-dom';
import DashboardStats from "./DashboardStats";

export default function Home() {
    const [dashboard, setDashboard] = useState<HomeDashboardDto | null>(null);
    const [error, setError] = useState<string>('');

    useEffect(() => {
        getDashboard().then(setDashboard).catch((err) => setError(err.message ?? String(err)));
    }, []);

    const SquareCard = ({title, subtitle, imageUrl, badge,}: {
        title: string;
        subtitle?: string;
        imageUrl: string;
        badge?: string;
    }) => (
        <article className="hc-card hc-card-square" aria-label={title}>
            <div className="hc-media">
                <picture>
                    <source
                        type="image/webp"
                        srcSet={`${imageUrl} 700w, ${imageUrl} 900w`}
                        sizes="(max-width:640px) 700px, 900px"
                    />
                    <img className="hc-img" src={imageUrl} alt={title} width={900} height={900} loading="lazy"/>
                </picture>
                {badge && <span className="hc-badge">{badge}</span>}
            </div>

            <div className="hc-body">
                <div className="hc-title">{title}</div>
                {subtitle && <div className="hc-sub">{subtitle}</div>}
            </div>
        </article>
    );

    const BoardCard = ({board}: { board: HomeDashboardDto["theMostPopularBoard"] }) => {
        return (
            <article className="hc-board-card">
                <div className="hc-board-thumb">
                    <picture>
                        <source
                            type="image/webp"
                            srcSet=""
                        />
                        <img
                            src={board.imageUrl}
                            alt={board.name}
                            loading="lazy"
                        />
                    </picture>
                </div>


                <div className="hc-board-info">
                    <h3 className="hc-board-title">{board.name}</h3>
                    <p className="hc-board-meta">
                        Players: <strong>{board.maxPlayers}</strong> <br />
                        Spaces: <strong>{board.spaces}</strong> <br />
                        Zones: <strong>{board.zones}</strong>
                    </p>
                    <Link to="/boards" className="hc-cta">
                        Browse Boards
                    </Link>
                </div>
            </article>
        );
    };

    return (
        <div className="dp-home dp-home-presentable">
            <div className="dp-sky" aria-hidden/>

            <header className="dp-header" role="banner">
                <div className="dp-logo" aria-hidden>
                    <DeadpoolMask className="dp-mask"/>
                </div>

                <div className="dp-title-wrap">
                    <h1 className="dp-title">
                        UNMATCHED TRACKER
                    </h1>
                    <p className="dp-lead">
                        Meta, decks & board highlights — for players and collectors.
                    </p>
                </div>
            </header>

            <main className="dp-main" role="main">
                <section className="hc-hero" aria-labelledby="hero-title">
                    <div className="hc-hero-left">
                        <h2 id="hero-title" className="hc-hero-title">
                            Master the Match. Know the Meta.
                        </h2>
                        <p className="hc-hero-sub">
                            Top decks, strongest sets and community-favorite boards — curated and ranked.
                        </p>

                        <div className="hc-hero-actions">
                            <Link to="/decks" className="hc-btn">
                                Explore Decks
                            </Link>
                            <Link to="/sets" className="hc-link">
                                Browse Sets
                            </Link>
                        </div>

                        <div className="hc-hero-note">
                            A little Deadpool note: <span className="hc-note">We track wins, not morals.</span>
                        </div>
                    </div>

                    <div className="hc-hero-right" aria-hidden>
                        <div className="hc-hero-plate"/>
                        <UnmatchedLogo className="hc-hero-mask"/>
                    </div>
                </section>

                <section className="dp-panel hc-panel" aria-live="polite">
                    {error && <div className="dp-error">Error: {error}</div>}
                    {!dashboard && !error && <div className="dp-loading">Loading dashboard...</div>}

                    {dashboard && (
                        <>
                            <DashboardStats dashboard={dashboard} />
                            <div className="hc-grid" role="list" aria-label="Highlights">
                                <SquareCard
                                    title="Top Deck — Strongest"
                                    subtitle={dashboard.theStrongestdDeck.name}
                                    imageUrl={dashboard.theStrongestdDeck.imageUrl}
                                    badge="Strongest"
                                />

                                <SquareCard
                                    title="Top Deck — Most Popular"
                                    subtitle={dashboard.theMostPopularDeck.name}
                                    imageUrl={dashboard.theMostPopularDeck.imageUrl}
                                    badge="Popular"
                                />

                                <SquareCard
                                    title="Top Set — Strongest"
                                    subtitle={dashboard.theStrongestSet.name}
                                    imageUrl={dashboard.theStrongestSet.imageUrl}
                                    badge="Strongest"
                                />

                                <SquareCard
                                    title="Top Set — Popular"
                                    subtitle={dashboard.theMostPopularSet.name}
                                    imageUrl={dashboard.theMostPopularSet.imageUrl}
                                    badge="Popular"
                                />
                            </div>

                            <div className="hc-feature" style={{marginTop: 16}}>
                                <BoardCard board={dashboard.theMostPopularBoard}/>
                            </div>
                        </>
                    )}
                </section>
            </main>

            <footer className="dp-footer" role="contentinfo">
                Made with ❤️ and sarcasm
            </footer>

            <p className="dp-deadpool-tag" aria-hidden>
                Deadpool was here
            </p>

            <div className="dp-noise" aria-hidden/>
        </div>
    );
}
