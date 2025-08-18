import React from 'react';
import { Link } from 'react-router-dom';
import { ReactComponent as DeadpoolMask } from '../../assets/deadpool-valentine.svg';
import './NotFound.css';

export default function NotFound() {
    const joke = "Don't come here again, T-Rex will come to me soon";

    return (
        <div className="nf-root" role="main">
            <div className="nf-card">
                <div className="nf-left">
                    <h1 className="nf-code">404</h1>
                    <h2 className="nf-title">You wandered into the wrong multiverse.</h2>
                    <p className="nf-lead">{joke}</p>

                    <div className="nf-hint">
                        <Link to="/" className="nf-btn">Go Home</Link>
                    </div>
                </div>

                <div className="nf-right" aria-hidden>
                    <div className="nf-mask-wrap">
                        <DeadpoolMask className="nf-mask" aria-hidden />
                    </div>
                </div>
            </div>

            <footer className="nf-footer">Made with ❤️, sarcasm and a tiny bit of chaos</footer>
        </div>
    );
}