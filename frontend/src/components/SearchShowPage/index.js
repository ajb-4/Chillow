import './SearchShowPage.css'
import * as searchActions from '../../store/search'; 
import { useDispatch } from 'react-redux';
import { useEffect, useState } from 'react';
import { fetchSearches} from '../../store/search';
import EditSearch from '../EditSearch';
import Modal from '../../Modal';

const SearchShowPage = ({search}) => {

    const dispatch = useDispatch();
    const [isOpen3, setIsOpen3] = useState(false);

    useEffect(() => {
        dispatch(fetchSearches())
    }, [dispatch])

    if (!search.priceMin || !search.priceMax) {
        return null
    }

    return (
        <>
            {/* Hello from Search Show
            {search.id} */}
            <div id='searchshow-container'>
                <div id='searchshow-leftside'>
                    <div id='searchshow-searchtitle'>Search #{search.id}</div>
                    <div id='searchshow-searchdetails'>
                        <div>For Sale:</div>
                        <div>${search.priceMin} - </div>
                        <div>${search.priceMax}</div>
                    </div>
                </div>
                <div id='searchshow-rightside'>
                    <div id='searchshow-editcontainer' onClick={ () => {setIsOpen3(!isOpen3)}}>
                        <i class="fa-sharp fa-light fa-pen-to-square"></i>
                        <div id='searchshow-edittext'>Edit</div>
                    </div>
                    <div id='searchshow-deletecontainer' onClick={ () => {dispatch(searchActions.deleteSearch(search.id))}} >
                        <i class="fa-sharp fa-light fa-trash" ></i>
                        <div id='searchshow-deletetext'>Delete</div>
                    </div>
                </div>
                <Modal open={isOpen3} onClose={() => setIsOpen3(false)} modalStyle='editsearch-ModalStyle'>
                    <EditSearch searchId={search.id}/>
                </Modal>
            </div>
        </>
    )

}

export default SearchShowPage;