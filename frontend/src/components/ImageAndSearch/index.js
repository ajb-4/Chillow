
import './ImageAndSearch.css';
import thumbnailphoto5 from '../../assets/images/ChillowImage6.jpeg'
import SearchBar from '../SearchBar';

const ImageAndSearch = () => {


    return (
        <>

        
        
            <div id='backgroundphoto-container'>
                <div id='mainpage-slogan'>Agents. Tours. Loans. Homes.</div>
                <div id='mainpage-searchbar-container'>
                    <SearchBar/>
                </div>
                <img src={thumbnailphoto5} alt='mainpagehouse' id="background-image"></img>
            </div>        
            
        
        
        
        </>
    )
}

export default ImageAndSearch;