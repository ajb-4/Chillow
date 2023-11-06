
import './ImageAndSearch.css';
import thumbnailphoto5 from '../../assets/images/ChillowImage8.jpeg'
const ImageAndSearch = () => {


    return (
        <>

        
        
            <div id='backgroundphoto-container'>
                {/* <div id='mainpage-slogan'>Agents. Tours. Loans. Homes.</div>
                <div id='mainpage-searchbar-container'>
                    <input type="text" id="mainpage-searchbar" placeholder='Search for Homes...'></input>
                </div> */}
                
                <img src={thumbnailphoto5} alt='mainpagehouse' id="background-image"></img>
            </div>        
            
        
        
        
        </>
    )
}

export default ImageAndSearch;