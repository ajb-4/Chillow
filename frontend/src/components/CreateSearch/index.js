import './CreateSearch.css';
import { useState } from 'react';
import * as searchActions from '../../store/search';
import * as filterActions from '../../store/filter';
import { useDispatch, useSelector } from 'react-redux';
import SearchBar from '../SearchBar';

const CreateSearch = () => {

    const [priceMin, setPriceMin] = useState();
    const [priceMax, setPriceMax] = useState();
    const [beds, setBeds] = useState();
    const [baths, setBaths] = useState();
    const [homeType, setHomeType] = useState();
    const [errors, setErrors] = useState();
    const dispatch = useDispatch();
    const [searchText, setSearchText] = useState();
    const [query, setQuery] = useState();

    const sessionUser = useSelector(state => state.session.user);
    

// testing

    function handleChange(e) {
        const query = e.target.value;
        searchText(query);
        if (query.trim != "") {
        }
    }

    const handleSearch = async (e) => {
        e.preventDefault();
 
        return dispatch(filterActions.fetchFilterResults({ priceMin,
            priceMax,
            beds,
            baths,
            homeType
            }))
        .catch(async (res) => {
        let data;
        try {
          data = await res.clone().json();
        } catch {
          data = await res.text();
        }
        })
    }

    const handleSubmit = async (e) => {
        e.preventDefault();
        setErrors([]);

        if (!sessionUser.id) {
            return;
        }
        return dispatch(searchActions.createSearch({  priceMin,
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
   

    return (
        <>
            <form onSubmit={handleSubmit} id='formcontainer'>
            <div id='createsearch-outtercontainer'>
                <div id='createsearch-searchbar'>
                    {/* <SearchBar id='createsearch-searchbar'/> */}
                    <input
                        type='text'
                        id='searchinput'
                        placeholder="Find your home"
                        value={searchText}
                        onChange={handleChange}>
                    </input>
                </div>
                <div id='forsale-dropdown'>
                    <div id='creaetesearch-forsaletext'>For sale</div>
                </div>
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
                {sessionUser && <div id='savesearch-buttoncontainer'>
                    <input type='submit' id='savesearch-button' value='Save search'></input>
                </div>}
                <div id='createsearch-searchbuttoncontainer' onClick={handleSearch}>
                    <input type='button' id='createsearch-button' value='Search'></input>
                </div>
            </div> 
            </form>   

        
        </>
    )
}

export default CreateSearch;