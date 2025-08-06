import {Link} from 'react-router-dom';
import {FaBoxOpen, FaChessBoard, FaHome, FaLayerGroup, FaPlus, FaUser, FaUsers} from 'react-icons/fa';
import './Header.css';

export default function Header() {
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

                <Link to="/sets" className="nav-link">
                    <span className="nav-link-inner">
                     <FaBoxOpen/>
                         <span>Sets</span>
                     </span>
                </Link>

                <Link to="/decks" className="nav-link">
                    <span className="nav-link-inner">
                        <FaLayerGroup/>
                         <span>Decks</span>
                     </span>
                </Link>

                <Link to="/boards" className="nav-link">
                    <span className="nav-link-inner">
                     <FaChessBoard/>
                         <span>Boards</span>
                     </span>
                </Link>
            </nav>
        </header>
    );
}
