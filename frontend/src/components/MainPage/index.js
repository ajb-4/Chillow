import HomeIndex from "../HomeIndex"
import ImageAndSearch from "../ImageAndSearch";
import './MainPage.css';


const MainPage = () => {

    return (
        <>

            <ImageAndSearch/>
            <br></br>
            <div id='mainpagehomeindex-container'>
                <HomeIndex/>
            </div>
            
            <br></br>   
        
        </>
    )

}

export default MainPage;