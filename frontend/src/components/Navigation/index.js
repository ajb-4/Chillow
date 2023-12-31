import { useState } from "react";
import React from "react";
import { useSelector } from "react-redux"
import { Link } from "react-router-dom/cjs/react-router-dom.min"
import ProfileButton from "./ProfileButton";
import "./Navigation.css"
import Modal from "../../Modal";
import UserAuthModal from "../UserAuthModal";
import logo from '../../assets/images/ChillowFontLogo.png'

const Navigation = () => {

    const sessionUser = useSelector(state => state.session.user)
    let sessionLink;
    const [isOpen2, setIsOpen2] = useState(false);
  

    if (sessionUser) {
        sessionLink = (<ProfileButton user={sessionUser}/>)
    } else {
        sessionLink = ( 
            <>
                <button id="signin-button" onClick={() => setIsOpen2(true)}>Sign In</button>
            </>     
        )
    }

    return (
        <>
        <div className="navbar">
            <div id="navbar-elements">
                <div id='navbar-leftside'>
                    <div id='nav-savedhomes'><Link to={`/favorites`} className="no-link-underline" id='nav-savedhomelink'>Saved homes</Link></div>
                    <div id='nav-savedsearches'><Link to={`/searches`} className="no-link-underline" id='nav-savedsearchlink'>Saved searches</Link></div>
                </div>
                <div id="zillowhomebutton"><Link to="/"><img src={logo} alt="logo"></img></Link></div>
                <div id='navbar-sessionlink'>{sessionLink}</div>
            </div>
            <div id="signin-up-profilebutton">      
                <Modal open={isOpen2} onClose={() => setIsOpen2(false)} modalStyle='userAuthModalStyle'>
                    <UserAuthModal/>
                </Modal>
            </div> 
        </div>
        </>
    )
}

export default Navigation;
