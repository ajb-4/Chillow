import React from "react";
import { Route, Switch } from "react-router-dom";
import Navigation from "./components/Navigation";
import "./index.css"
import MainPage from "./components/MainPage";
import PropertyHome from "./components/PropertyHome";
import SavedSearches from "./components/SavedSearches";
import SavedHomes from "./components/SavedHomes";




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
      <Route path="/favorites">
        <SavedHomes/>
      </Route>
    </Switch>
   

    </>
  );
}



export default App;

