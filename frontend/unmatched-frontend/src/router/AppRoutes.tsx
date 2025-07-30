import {Routes, Route} from 'react-router-dom'
import {Parties} from '../pages/Parties/Parties'
import {Home} from '../pages/Home/Home';

export default function AppRoutes() {
    return (
      <Routes>
          <Route path="/" element={<Home/>}/>

          <Route path="/parties" element={<Parties/>}/>
      </Routes>
    );
}