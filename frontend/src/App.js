import React from "react";
import {Route, Switch, useParams} from "react-router-dom";
import Navigation from "./components/Navigation";
import "./index.css"
import MainPage from "./components/MainPage";
import ShowModal from "./ShowModal";
import HomeShow from "./components/HomeShow";
import PropertyHome from "./components/PropertyHome";
import SavedSearches from "./components/SavedSearches";




function App() {
  return (
    <>
   
    <Navigation/>
  
    <Switch>
      <Route exact path='/'>
        <MainPage/>
      </Route>
      <Route path="/homes/:homeId">
        <PropertyHome/>
      </Route>
      <Route path="/homes">
        <PropertyHome/>
      </Route>
      <Route path="/searches">
        <SavedSearches/>
      </Route>
    </Switch>
   

    </>
  );
}



export default App;

