import './SavedHomes.css';
import { useDispatch, useSelector } from 'react-redux';
import { fetchLikes, getLikes } from '../../store/likes';
import { fetchHomes, getHomes } from '../../store/homes';
import { useEffect } from 'react';
import HomeIndexItem from '../HomeIndexItem';

const SavedHomes = () => {

    const dispatch = useDispatch();
    const likes = useSelector(getLikes);
    const homes = useSelector(getHomes);

    useEffect(() => {
        dispatch(fetchHomes());
        dispatch(fetchLikes());
    }, [dispatch])

    if (!likes) {
        return null;
    }

    const savedHomes = homes.filter(home =>
        likes.some(like => like.homeId === home.id)
    );

    return (
        <>
            <div id='savedhomes-outtercontainer'>
                <div id='savedhomes-container'>
                    <div id='savedhomes-header'>Saved homes</div>
                    <div id='savedhomes-index'>
                        {savedHomes.map(home => 
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