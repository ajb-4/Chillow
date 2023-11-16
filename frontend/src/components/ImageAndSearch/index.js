
import './ImageAndSearch.css';
import thumbnailphoto5 from '../../assets/images/ChillowImage6.jpeg'
import SearchBar from '../SearchBar';
import { useState } from 'react';

const ImageAndSearch = () => {

    const [searchText, setSearchText] = useState();
    const [query, setQuery] = useState();

    function handleChange(e) {
        const query = e.target.value;
        searchText(query);
        if (query.trim != "") {
        }
    }

    return (
        <>
            <div id='backgroundphoto-container'>
                <div id='mainpage-slogan'>Agents. Tours. Loans. Homes.</div>
                <div id='mainpage-searchbar-container'>
                    {/* <SearchBar/> */}
                    <input
                        type='text'
                        id='searchinput-mainpage'
                        placeholder="Find your home"
                        value={searchText}
                        onChange={handleChange}>
                    </input>
                    <i class="fa-solid fa-magnifying-glass"></i>
                </div>
                <img src={thumbnailphoto5} alt='mainpagehouse' id="background-image"></img>
            </div>        
        </>
    )
}

export default ImageAndSearch;