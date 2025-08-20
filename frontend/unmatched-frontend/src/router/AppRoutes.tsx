import {Route, Routes} from 'react-router-dom'
import Parties from '../pages/Parties/Parties'
import Home from '../pages/Home/Home';
import CreateParty from "../pages/CreateParty/CreateParty";
import Party from "../pages/Party/Party";
import Layout from "../components/Layout/Layout";
import Decks from "../pages/Decks/Decks";
import Deck from "../pages/Deck/Deck";
import DecksTop from "../pages/DecksTop/DecksTop";
import Sets from "../pages/Sets/Sets";
import Set from "../pages/Set/Set";
import Boards from "../pages/Boards/Boards";
import CreateUser from "../pages/CreateUser/CreateUser";
import NotFound from "../pages/NotFound/NotFound";
import RandomDeck from "../pages/RandomDeck/RandomDeck";

export default function AppRoutes() {
    return (
        <Routes>
            <Route path="/" element={<Layout/>}>

                <Route path="/" element={<Home/>}/>

                <Route path="/user/create" element={<CreateUser/>}/>

                <Route path="/parties" element={<Parties/>}/>
                <Route path="/parties/:matchId" element={<Party/>}/>
                <Route path="/parties/new" element={<CreateParty/>}/>

                <Route path="/sets" element={<Sets/>}/>
                <Route path="/sets/:name" element={<Set/>}/>

                <Route path="/decks" element={<Decks/>}/>
                <Route path="/decks/:name" element={<Deck/>}/>
                <Route path="/decks/top" element={<DecksTop/>}/>
                <Route path="/decks/random" element={<RandomDeck/>}/>

                <Route path="/boards" element={<Boards/>}/>

                <Route path="*" element={<NotFound/>}/>
            </Route>
        </Routes>
    );
}