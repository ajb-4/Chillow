import { useDispatch, useSelector } from 'react-redux';
import './SavedSearches.css';
import { fetchSearches, getSearches } from '../../store/search';
import SearchShowPage from '../SearchShowPage';
import { useEffect } from 'react';

const SavedSearches = () => {

    const dispatch = useDispatch();
    const searches = useSelector(getSearches);
    
    
    useEffect(() => {
        dispatch(fetchSearches())
    }, [dispatch])


    if (!searches) {
        return null;
    }
    return (
        <>
            <div id='savedsearches-outtercontainer'>
                <div id='savedsearches-container'>
                    <div id='savedsearches-header'>Saved searches</div>
                    <div id='savedsearches-index'>
                        {searches.map(search => 
                            <div className='searchitem'>
                                <SearchShowPage search={search}/>
                            </div>
                        )}
                    </div>
                </div>
            </div>
        </>
    )
}

export default SavedSearches;