import LoginFormPage from "../LoginFormPage"
import SignUpFormPage from "../SignUpFormPage"
import { useState } from "react"
import "./UserAuthModal.css"

const UserAuthModal = ({onClose}) => {

    const [signInTab, setSignInTab] = useState(true);
    let renderedForm;

    if (signInTab) {
        renderedForm = (
            <LoginFormPage/>
        )
    } else {
        renderedForm = (
            <SignUpFormPage/>
        )
    }

    return (
        <>
            <div id="userauth-modalheader">
                <h1 id="welcomemessage">Welcome to Chillow</h1>
                <div className="toggleFormMenu">
                    <div className={signInTab ? 'clickedForm' : 'unclicked'}>
                        <button onClick={() => setSignInTab(true)} id="toggleto-signin">Sign in</button>
                    </div>
                    <div className={signInTab ? 'unclicked' : 'clickedForm'}>
                        <button onClick={() => setSignInTab(false)} id="toggleto-signup">New account</button>
                    </div>
                </div>
            </div>
            
            {renderedForm}
        </>
    )
}

export default UserAuthModal;