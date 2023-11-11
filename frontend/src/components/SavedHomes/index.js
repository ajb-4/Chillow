import './SavedHomes.css';
import { useDispatch, useSelector } from 'react-redux';
import { fetchLikes, getLikes } from '../../store/likes';
import { useEffect } from 'react';
import HomeIndexItem from '../HomeIndexItem';

const SavedHomes = () => {

    const dispatch = useDispatch();
    const likes = useSelector(getLikes);

    useEffect(() => {
        dispatch(fetchLikes())
    }, [dispatch])

    if (!likes) {
        return null;
    }

    return (
        <>
            <div id='savedhomes-outtercontainer'>
                <div id='savedhomes-container'>
                    <div id='savedhomes-header'>Saved home</div>
                    <div id='savedhomes-index'>
                        {homes.map(home => 
                            <div className='listingthumbnail'>
                                <HomeIndexItem home={home}/>
                            </div>
                        )}
                    </div>
                </div>
            </div>     
        </>
    )

}

export default SavedHomes;