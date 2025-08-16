import { FaEnvelope, FaTelegramPlane, FaGithub } from 'react-icons/fa';
import {ReactComponent as Heart} from '../../assets/heart.svg';
import './Footer.css';

export default function Footer() {
    return (
        <footer className="footer">
            <div className="footer-text">
                <p>
                    © {new Date().getFullYear()} Unmatched Tracker by Vyacheslav Radiuk
                    <span className="dp-footer-handwritten">
                        and Deadpool <Heart className="dp-footer-logo"/>
                    </span>
                </p>

                <p>
                    This site was made for educational purposes.
                    Site is not in any way affiliated with Restoration Games or Mondo Games.
                    The look and design of Unmatched cards is a trademark of Restoration Games.
                    Decks using this design may not be used for commercial purposes.
                </p>
            </div>

            <div className="footer-icons">
                <a href="mailto:vyacheslavradiuk@gmail.com" title="Email">
                    <FaEnvelope />
                </a>
                <a
                    href="https://t.me/vyacheslavradiuk"
                    target="_blank"
                    rel="noopener noreferrer"
                    title="Telegram"
                >
                    <FaTelegramPlane />
                </a>
                <a
                    href="https://github.com/Cueerno"
                    target="_blank"
                    rel="noopener noreferrer"
                    title="GitHub"
                >
                    <FaGithub />
                </a>
            </div>
        </footer>
    );
}
