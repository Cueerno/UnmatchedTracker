import React, {ReactNode, useRef, useState} from 'react';
import {Link} from 'react-router-dom';
import useOnClickOutside from '../../hooks/useOnClickOutside/useOnClickOutside';
import {NavLink} from '../Header_and_Footer/Header';

interface DropdownProps {
    icon: ReactNode;
    label: string;
    submenu: NavLink[];
}

export default function Dropdown({icon, label, submenu}: DropdownProps) {
    const [open, setOpen] = useState(false);
    const ref = useRef<HTMLDivElement>(null);

    useOnClickOutside(ref, () => setOpen(false));

    return (
        <div
            ref={ref}
            className="nav-link dropdown"
            onClick={() => setOpen(o => !o)}
        >
      <span className="nav-link-inner">
        {icon}
          <span>{label}</span>
      </span>

            {open && (
                <ul className="dropdown-menu">
                    {submenu.map(sub => (
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
