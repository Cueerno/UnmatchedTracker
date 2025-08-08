import React, {useEffect, useRef, useState} from 'react';
import {Link} from 'react-router-dom';
import {
    FaBoxOpen,
    FaCaretDown,
    FaChartBar,
    FaChessBoard,
    FaHome,
    FaLayerGroup,
    FaPlus,
    FaUser,
    FaUsers
} from 'react-icons/fa';
import './Header.css';

export default function Header() {
    const [dropdownOpen, setDropdownOpen] = useState(false);
    const dropdownRef = useRef<HTMLDivElement>(null);

    useEffect(() => {
        const handleClickOutside = (e: MouseEvent) => {
            if (
                dropdownRef.current &&
                !dropdownRef.current.contains(e.target as Node)
            ) {
                setDropdownOpen(false);
            }
        };
        document.addEventListener('mousedown', handleClickOutside);
        return () => document.removeEventListener('mousedown', handleClickOutside);
    }, []);

    return (
        <header className="header">
            <h2>Unmatched Tracker</h2>
            <nav className="nav-links">
                <Link to="/" className="nav-link">
                    <span className="nav-link-inner">
                        <FaHome/>
                        <span>Home</span>
                    </span>
                </Link>

                <Link to="/user/create" className="nav-link">
                    <span className="nav-link-inner">
                        <FaPlus/>
                        <FaUser/>
                        <span>User</span>
                    </span>
                </Link>

                <Link to="/parties" className="nav-link">
                    <span className="nav-link-inner">
                        <FaUsers/>
                        <span>Parties</span>
                    </span>
                </Link>

                <div
                    className="nav-link dropdown"
                    ref={dropdownRef}
                    onClick={() => setDropdownOpen(open => !open)}
                >
                    <span className="nav-link-inner">
                        <span>UmDb</span>
                        <FaCaretDown/>
                    </span>

                    {dropdownOpen && (
                        <ul className="dropdown-menu">
                            <li>
                                <Link to="/sets" className="dropdown-item">
                                    <span className="nav-link-inner">
                                        <FaBoxOpen/>
                                        <span>Sets</span>
                                    </span>
                                </Link>
                            </li>
                            <li>
                                <Link to="/decks" className="dropdown-item">
                                    <span className="nav-link-inner">
                                        <FaLayerGroup/>
                                        <span>Decks</span>
                                    </span>
                                </Link>
                            </li>
                            <li>
                                <Link to="/boards" className="dropdown-item">
                                    <span className="nav-link-inner">
                                        <FaChessBoard/>
                                        <span>Boards</span>
                                    </span>
                                </Link>
                            </li>
                        </ul>
                    )}
                </div>

                <Link to="/decks/top" className="nav-link">
                    <span className="nav-link-inner">
                        <FaChartBar/>
                        <span>Top</span>
                    </span>
                </Link>

            </nav>
        </header>
    );
}
