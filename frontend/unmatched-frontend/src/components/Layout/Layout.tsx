import {Outlet} from 'react-router-dom';
import Header from '../Header_and_Footer/Header';
import Footer from "../Header_and_Footer/Footer";

export default function Layout() {
    return (
        <div
            style={{
                minHeight: '100vh',
                display: 'flex',
                flexDirection: 'column',
                //backgroundColor: '#e4b1b1'
            }}
        >
            <Header/>
            <main style={{flexGrow: 1, padding: '2rem'}}>
                <Outlet/>
            </main>
            <Footer/>
        </div>
    );
}
