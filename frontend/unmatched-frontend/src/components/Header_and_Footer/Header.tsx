import React, {ReactNode, useEffect, useMemo, useRef, useState} from 'react';
import {Link} from 'react-router-dom';
import {
    FaBars,
    FaBoxOpen,
    FaChartBar,
    FaChessBoard,
    FaHome,
    FaLayerGroup,
    FaTimes,
    FaUser,
    FaUsers
} from 'react-icons/fa';
import './Header.css';

interface NavLink {
    to: string;
    icon: ReactNode;
    label: string;
}

interface NavDropdown {
    icon: ReactNode;
    label: string;
    submenu: NavLink[];
}

type NavItem = NavLink | NavDropdown;

export default function Header() {
    const [dropdownOpen, setDropdownOpen] = useState(false);
    const [mobileOpen, setMobileOpen]     = useState(false);
    const dropdownRef = useRef<HTMLDivElement>(null);
    const mobileRef   = useRef<HTMLDivElement>(null);

    const links: NavItem[] = [
        {to: '/user/create', icon: <FaUser/>, label: 'Add user'},
        {to: '/parties', icon: <FaUsers/>, label: 'Parties'},
        {
            icon: <FaLayerGroup/>,
            label: 'UmDb',
            submenu: [
                {to: '/sets', icon: <FaBoxOpen/>, label: 'Sets'},
                {to: '/decks', icon: <FaLayerGroup/>, label: 'Decks'},
                {to: '/boards', icon: <FaChessBoard/>, label: 'Boards'},
            ]
        },
        {to: '/decks/top', icon: <FaChartBar/>, label: 'Top'}
    ];

    const mobileItems = useMemo(() => {
        type Mi = NavLink & { indent: boolean };
        return links.reduce<Mi[]>((acc, item) => {
            if ('submenu' in item) {
                item.submenu.forEach(sub => acc.push({...sub, indent: true}));
            } else {
                acc.push({...item, indent: false});
            }
            return acc;
        }, []);
    }, [links]);

    useEffect(() => {
        const onClickOutside = (e: MouseEvent) => {
            if (dropdownRef.current && !dropdownRef.current.contains(e.target as Node)) {
                setDropdownOpen(false);
            }
        };
        document.addEventListener('mousedown', onClickOutside);
        return () => document.removeEventListener('mousedown', onClickOutside);
    }, []);

    return (
        <header className="header">

            <Link to={"/"} className={"logo"}>
                <img
                    src={"achilles_white.png"}
                    alt={"Achilles logo"}
                    className="logo-icon"
                />
                <span className="logo-text">Unmatched Tracker</span>
            </Link>

            <nav className="nav-links">
                {links.map(item => {
                    if ('submenu' in item) {
                        return (
                            <div
                                key={item.label}
                                className="nav-link dropdown"
                                onClick={() => setDropdownOpen(o => !o)}
                                ref={dropdownRef}
                            >
                                <span className="nav-link-inner">
                                    {item.icon}
                                    <span>{item.label}</span>
                                </span>

                                {dropdownOpen && (
                                    <ul className="dropdown-menu">
                                        {item.submenu.map(sub => (
                                            <li key={sub.to}>
                                                <Link to={sub.to} className="dropdown-item">
                                                    <span className="nav-link-inner">
                                                        {sub.icon}
                                                        <span>{sub.label}</span>
                                                    </span>
                                                </Link>
                                            </li>
                                        ))}
                                    </ul>
                                )}
                            </div>
                        );
                    }

                    return (
                        <Link key={item.to} to={item.to} className="nav-link">
                            <span className="nav-link-inner">
                                {item.icon}
                                <span>{item.label}</span>
                            </span>
                        </Link>
                    );
                })}
            </nav>

            {/* mobile */}
            <div className="mobile-menu" ref={mobileRef}>
                <button
                    className="menu-toggle"
                    onClick={() => setMobileOpen(o => !o)}
                    aria-label="Toggle menu"
                >
                    {mobileOpen ? <FaTimes/> : <FaBars/>}
                </button>

                {mobileOpen && (
                    <ul className="mobile-dropdown">
                        {mobileItems.map(item => (
                            <li key={item.to}>
                                <Link
                                    to={item.to}
                                    className={`dropdown-item${item.indent ? ' indent' : ''}`}
                                    onClick={() => setMobileOpen(false)}
                                >
                                    <span className="nav-link-inner">
                                        {item.icon}
                                        <span>{item.label}</span>
                                    </span>
                                </Link>
                            </li>
                        ))}
                    </ul>
                )}
            </div>
        </header>
    );
}
