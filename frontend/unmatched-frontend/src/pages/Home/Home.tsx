import React, {useEffect, useState} from 'react';
import {ReactComponent as DeadpoolMask} from '../../assets/deadpool-logo.svg';
import './Home.css';

export function Home() {
    const [popped, setPopped] = useState(false);
    const [text, setText] = useState('Where are my chimichangas?');

    useEffect(() => {
        let t: ReturnType<typeof setTimeout> | null = null;

        if (popped) {
            setText('CHIMICHANGAS FOUND!');
            t = setTimeout(() => {
                setPopped(false);
                setText('Where are my chimichangas?');
            }, 1600);
        }

        return () => {
            if (t !== null) {
                clearTimeout(t);
            }
        };
    }, [popped]);


    function handleClick() {
        if (popped) return;
        setPopped(true);
    }

    return (
        <div className="dp-home">
            <div className="dp-sky" aria-hidden/>

            <header className="dp-header">
                <div className="dp-logo" aria-hidden>
                    <DeadpoolMask className="dp-mask"/>
                </div>

                <div className="dp-title-wrap">
                    <h1 className="dp-title">
                        UNMATCHED TRACKER
                    </h1>
                    <p className="dp-lead">Jokes, harassment and heroic battles — all in one place.</p>
                </div>
            </header>

            <main className="dp-main">
                <div className="dp-panel">
                    <div className="dp-comic">
                        <div className="dp-comic__mask"/>
                        <button
                            type="button"
                            className={`dp-comic__text ${popped ? 'pop' : ''}`}
                            onClick={handleClick}
                            aria-pressed={popped}
                        >
                            <span className="dp-comic__label">{text}</span>
                        </button>
                    </div>

                    <div className="dp-spotlights" aria-hidden>
                        <span/>
                        <span/>
                        <span/>
                    </div>
                </div>
            </main>

            <footer className="dp-footer">Made with ❤️ and sarcasm</footer>

            <p className="dp-deadpool-tag">Deadpool was here</p>

            <div className="dp-noise" aria-hidden/>
        </div>
    );
}
