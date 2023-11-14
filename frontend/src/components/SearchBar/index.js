import './SearchBar.css';
import { useState } from 'react';

const SearchBar = () => {
    const [searchText, setSearchText] = useState();
    const [query, setQuery] = useState();

    function handleChange(e) {
        const query = e.target.value;
        searchText(query);
        if (query.trim != "") {
        }
    }

    function handleClick(id) {
        return (e) => {
            e.preventDefault();

        }
    }

    // function handleSubmit(e) {
    //     e.preventDefault;
    //     if (query.trim != "") {
    //         }
    // }

    return () => (
       <> 
        <div className="searchbar-container">

            <input
            type='text'
            id='searchinput'
            placeholder="Find your home"
            value={searchText}
            onChange={handleChange}>
            </input>

        </div>

        {/* <button>Search</button> */}

        </>
    )
}

export default SearchBar;