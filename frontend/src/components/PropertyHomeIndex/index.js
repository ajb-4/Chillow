import './PropertyHomeIndex.css';
import HomeIndexItem from "../HomeIndexItem";
import { fetchHomes, getHomes } from "../../store/homes";
import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux"
import { fetchLikes } from '../../store/likes';

const PropertyHomeIndex = () => {
    const dispatch = useDispatch();
    const homes = useSelector(getHomes);

    useEffect(() => {
        dispatch(fetchHomes());
        dispatch(fetchLikes());
    }, [dispatch])

    return (
        <>
                <div id='prophomeindex-grid'>
                    {homes.map(home => 
                        <div className='listingthumbnail'>
                            <HomeIndexItem home={home}/>
                        </div>
                    )}
                </div>
        </>
    )
}

export default PropertyHomeIndex;