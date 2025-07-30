import {Routes, Route} from 'react-router-dom'
import {Parties} from '../pages/Parties/Parties'
import {Home} from '../pages/Home/Home';
import {CreateParty} from "../pages/CreateParty/CreateParty";
import {Party} from "../pages/Party/Party";

export default function AppRoutes() {
    return (
      <Routes>
          <Route path="/" element={<Home/>}/>

          <Route path="/parties" element={<Parties/>}/>
          <Route path="/parties/:matchId" element={<Party/>}/>
          <Route path="/parties/new" element={<CreateParty/>}/>
      </Routes>
    );
}