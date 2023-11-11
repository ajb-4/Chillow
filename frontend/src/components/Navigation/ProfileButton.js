import * as sessionActions from '../../store/session';
import { useDispatch, useSelector} from 'react-redux';
import {useState, useEffect} from 'react';
import './ProfileButton.css'
import {Link} from 'react-router-dom';


const ProfileButton = () => {
    const sessionUser = useSelector(state => state.session.user)   
    const dispatch = useDispatch();
    let [showMenu, setShowMenu] = useState(false);
    let menu;
   

    if (showMenu) {
        menu = (
           <>
            <div id="profdropdownmenu">
                <div id='profdropdown-savedhomes'><Link to={`/favorites`} className="no-link-underline" id='savedhomelink'>Saved homes</Link></div>
                <div id='profdropdown-savedsearches'><Link to={`/searches`} className="no-link-underline" id='savedsearchlink'>Saved searches</Link></div>
                <div id='profdropdown-useremail'>{sessionUser.email}</div>
                <div id='profdropdown-signout'>
                    <button type="submit" onClick={() => {dispatch(sessionActions.logout())}} id='signout-button'>Sign out</button>
                </div>
            </div>
           </> 
        )
    } else {
        menu = (<></>)
    }

    useEffect(() => {
        if (!showMenu) return;
        const closeMenu = () => {
            setShowMenu(false)
        }
        document.addEventListener('click', closeMenu);
        return () => document.removeEventListener('click', closeMenu)
    }, [showMenu])

    return (
       <>
            <div onClick={() => {setShowMenu(true)}} id="profiledropdownbutton">
                <i class="fa-regular fa-user"></i>
                {menu}
            </div>
            
       </> 
       
    )
}

export default ProfileButton;