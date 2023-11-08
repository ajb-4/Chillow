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
                <button className="signin-button" onClick={() => setIsOpen2(true)}>Sign In</button>
            </>     
        )
    }

    console.log('test Alex')

    return (
        <>
        <div className="navbar">
            <div className="navbar-elements">
                <div id="zillowhomebutton"><Link to="/"><img src={logo} alt="logo"></img></Link></div>
                {sessionLink}
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
