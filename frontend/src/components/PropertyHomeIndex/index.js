import './PropertyHomeIndex.css';
import HomeIndexItem from "../HomeIndexItem";
import { fetchHomes, getHomes } from "../../store/homes";
import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux"
import { fetchLikes } from '../../store/likes';
import { getFilters } from '../../store/filter';

const PropertyHomeIndex = () => {
    const dispatch = useDispatch();
    const homes = useSelector(getHomes);
    const filteredHomes = useSelector(getFilters);

    useEffect(() => {
        dispatch(fetchHomes());
        dispatch(fetchLikes());
    }, [dispatch])

    return (
        <>
                <div id='prophomeindex-grid'>
                    {filteredHomes.map(home => 
                        <div className='listingthumbnail'>
                            <HomeIndexItem home={home}/>
                        </div>
                    )}
                </div>
        </>
    )
}

export default PropertyHomeIndex;