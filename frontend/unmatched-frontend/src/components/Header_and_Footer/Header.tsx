import React, {ReactNode, useRef, useState} from 'react';
import {ReactComponent as Achilles} from "../../assets/achilles.svg";
import {Link} from 'react-router-dom';
import {
    FaBars,
    FaBoxOpen,
    FaChartBar,
    FaChessBoard,
    FaLayerGroup,
    FaPlus,
    FaTimes,
    FaUser,
    FaUsers
} from 'react-icons/fa';
import Dropdown from '../Dropdown/Dropdown';
import './Header.css';

export interface NavLink {
    to: string;
    icon: ReactNode;
    label: string;
}

export interface NavDropdown {
    icon: ReactNode;
    label: string;
    submenu: NavLink[];
}

type NavItem = NavLink | NavDropdown;

export default function Header() {
    const [mobileOpen, setMobileOpen] = useState(false);
    const mobileRef = useRef<HTMLDivElement>(null);

    const links: NavItem[] = [
        {to: '/user/create', icon: <FaUser/>, label: 'Add user'},
        {
            icon: <FaUsers/>,
            label: 'Parties',
            submenu: [
                {to: '/parties', icon: <FaUsers/>, label: 'Party list'},
                {to: '/parties/new', icon: <FaPlus/>, label: 'Add Party'},
            ],
        },
        {
            icon: <FaLayerGroup/>,
            label: 'UmDb',
            submenu: [
                {to: '/sets', icon: <FaBoxOpen/>, label: 'Sets'},
                {to: '/decks', icon: <FaLayerGroup/>, label: 'Decks'},
                {to: '/boards', icon: <FaChessBoard/>, label: 'Boards'},
            ],
        },
        {to: '/decks/top', icon: <FaChartBar/>, label: 'Top'},
    ];

    return (
        <header className="header">
            <Link to="/" className="logo">
                <div className="logo-icon">
                    <Achilles/>
                </div>
                <span className="logo-text">Unmatched Tracker</span>
            </Link>

            <nav className="nav-links">
                {links.map(item => {
                    if ('submenu' in item) {
                        return (
                            <Dropdown
                                key={item.label}
                                icon={item.icon}
                                label={item.label}
                                submenu={item.submenu}
                            />
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
                        {links.map(item => {
                            if ('submenu' in item) {
                                return (
                                    <React.Fragment key={item.label}>
                                        <li className="mobile-dropdown-heading">
                                            <span className="nav-link-inner">
                                                {item.icon}
                                                <span>{item.label}</span>
                                            </span>
                                        </li>
                                        {item.submenu.map(sub => (
                                            <li key={sub.to}>
                                                <Link
                                                    to={sub.to}
                                                    className="dropdown-item indent"
                                                    onClick={() => setMobileOpen(false)}
                                                >
                                                    <span className="nav-link-inner">
                                                        {sub.icon}
                                                        <span>{sub.label}</span>
                                                    </span>
                                                </Link>
                                            </li>
                                        ))}
                                    </React.Fragment>
                                );
                            }

                            return (
                                <li key={item.to}>
                                    <Link
                                        to={item.to}
                                        className="dropdown-item"
                                        onClick={() => setMobileOpen(false)}
                                    >
                                        <span className="nav-link-inner">
                                            {item.icon}
                                            <span>{item.label}</span>
                                        </span>
                                    </Link>
                                </li>
                            );
                        })}
                    </ul>
                )}
            </div>
        </header>
    );
}
