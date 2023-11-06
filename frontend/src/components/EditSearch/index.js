import './EditSearch.css';
import { useState, useEffect } from 'react';
import * as searchActions from '../../store/search';
import { useDispatch, useSelector } from 'react-redux';

const EditSearch = ({searchId}) => {

    const [priceMin, setPriceMin] = useState();
    const [priceMax, setPriceMax] = useState();
    const [beds, setBeds] = useState();
    const [baths, setBaths] = useState();
    const [homeType, setHomeType] = useState();
    const [searcherId, setSearcherId] = useState();
    const [errors, setErrors] = useState();
    const dispatch = useDispatch();
    const search = useSelector(searchActions.getSearch(searchId));
    const sessionUser = useSelector(state => state.session.user);
    

    // const [priceDropDown, setDropdownVisible] = useState(false);

    const handleSubmit = async (e) => {
        e.preventDefault();
        setErrors([]);

        if (!sessionUser.id) {
            return;
        }
        return dispatch(searchActions.updateSearch({ 
            id: searchId,
            priceMin,
            priceMax,
            beds,
            baths,
            homeType,
            searcherId: sessionUser.id }))
        .catch(async (res) => {
        let data;
        try {
          data = await res.clone().json();
        } catch {
          data = await res.text();
        }
        if (data?.errors) setErrors(data.errors);
        else if (data) setErrors([data]);
        else setErrors([res.statusText]);
      });
    }

    useEffect(() => {
        if (search) {
          setPriceMin(search.priceMin || '');
          setPriceMax(search.priceMax || '');
          setBeds(search.beds || '');
          setBaths(search.baths || '');
          setHomeType(search.homeType || '');
          setSearcherId(search.searcherId || '');
        }
      }, [searchId, search]);

    // if (!search) {
    //     return null
    // }
   console.log(errors)

    return (
        <>
            <form onSubmit={handleSubmit} id='formcontainer'>
            <div id='editsearch-outtercontainer'>
            
                <div id='editsearch-header'>
                    <div>Edit saved search</div>
                </div>
                <div id='editsearch-form'>
                    <div id='price-dropdown'>
                        <input type='text'
                        value={priceMin}
                        onChange={(e) => setPriceMin(e.target.value)}
                        placeholder='Min Price'
                        id='minprice-createsearch'></input>
                        <input type='text'
                        value={priceMax}
                        onChange={(e) => setPriceMax(e.target.value)}
                        placeholder='Max Price'
                        id='maxprice-createsearch'></input>
                    </div>
                    <div id='bednbaths-dropdown'>
                        <input type='text'
                        value={beds}
                        onChange={(e) => setBeds(e.target.value)}
                        placeholder='Min Beds'
                        id='bedrooms-createsearch'></input>
                        <input type='text'
                        value={baths}
                        onChange={(e) => setBaths(e.target.value)}
                        placeholder='Min Baths'
                        id='bathrooms-createsearch'></input>
                    </div>
                    <div id='hometype-dropdown'>
                        <input type='text'
                        value={homeType}
                        onChange={(e) => setHomeType(e.target.value)}
                        placeholder='Home Type'
                        id='hometype-createsearch'></input>
                    </div>
                </div>
                <div id='editsearch-footer'>
                    <div id='editsearch-leftside'>
                        <div id='editsearch-buttoncontainer' onClick={ () => {dispatch(searchActions.deleteSearch(searchId))}}>
                            <input type='submit' id='editsearch-button' value='Delete'></input>
                        </div>
                    </div>
                    <div id='editsearch-rightside'>
                        <div id='editsearch-buttoncontainer'>
                            <input type='submit' id='editsearch-button' value='Cancel'></input>
                        </div>
                        <div id='editsearch-buttoncontainer'>
                            <input type='submit' id='editsearch-button' value='Update' onClick={handleSubmit}></input>
                        </div>
                    </div>
                </div>
            </div> 
            </form>   

        
        </>
    )
}

export default EditSearch;