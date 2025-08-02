import {Routes, Route} from 'react-router-dom'
import {Parties} from '../pages/Parties/Parties'
import {Home} from '../pages/Home/Home';
import {CreateParty} from "../pages/CreateParty/CreateParty";
import {Party} from "../pages/Party/Party";
import Layout from "../components/Layout/Layout";
import {Characters} from "../pages/Characters/Characters";
import {Character} from "../pages/Character/Character";
import {CharactersTop} from "../pages/CharactersTop/CharactersTop";
import {Sets} from "../pages/Sets/Sets";

export default function AppRoutes() {
    return (
        <Routes>
            <Route path="/" element={<Layout/>}>

                <Route path="/" element={<Home/>}/>

                <Route path="/parties" element={<Parties/>}/>
                <Route path="/parties/:matchId" element={<Party/>}/>
                <Route path="/parties/new" element={<CreateParty/>}/>

                <Route path="/sets" element={<Sets/>}/>

                <Route path="/characters" element={<Characters/>}/>
                <Route path="/characters/:name" element={<Character/>}/>
                <Route path="/characters/top" element={<CharactersTop/>}/>
            </Route>
        </Routes>
    );
}