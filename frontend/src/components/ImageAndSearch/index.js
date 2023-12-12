
import './ImageAndSearch.css';
import thumbnailphoto5 from '../../assets/images/ChillowImage6.jpeg'
import { useState } from 'react';
import { useHistory } from 'react-router-dom';
import { useDispatch } from 'react-redux';
import * as filterActions from '../../store/filter';

const ImageAndSearch = () => {

    const [phrase, setPhrase] = useState("");
    const history = useHistory();
    const dispatch = useDispatch();

    const handleSearch = async (e) => {
 
        dispatch(filterActions.fetchFilterResults({ 
            priceMin: "",
            priceMax: "",
            beds: "",
            baths: "",
            homeType: "",
            phrase
            }))
        .catch(async (res) => {
        let data;
        try {
          data = await res.clone().json();
        } catch {
          data = await res.text();
        }
        })
        history.push(`/homes`)
    }

    const handleKeyPress = (e) => {
        if (e.key === 'Enter') {
            handleSearch();
        }
    };

    return (
        <>
            <div id='backgroundphoto-container'>
                <div id='mainpage-slogan'>Agents. Tours. Loans. Homes.</div>
                <div id='mainpage-searchbar-container'>
                    <input
                        type='text'
                        id='searchinput-mainpage'
                        placeholder="Find homes by state, city, or zipcode"
                        value={phrase}
                        onChange={(e) => setPhrase(e.target.value)}
                        onKeyDown={handleKeyPress}>
                    </input>
                    <i class="fa-solid fa-magnifying-glass" onClick={handleSearch}></i>
                </div>
                <img src={thumbnailphoto5} alt='mainpagehouse' id="background-image"></img>
            </div>        
        </>
    )
}

export default ImageAndSearch;