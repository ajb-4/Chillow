import { useDispatch, useSelector } from "react-redux"
import { fetchHomes, getHomes } from "../../store/homes";
import { useEffect } from "react";
import HomeIndexItem from "../HomeIndexItem";
import './HomeIndex.css';
import Slider from "react-slick";
import 'slick-carousel/slick/slick.css';
import 'slick-carousel/slick/slick-theme.css';



const HomeIndex = () => {
    const dispatch = useDispatch();
    const homes = useSelector(getHomes);

    const sliderSettings = {
        slidesToShow: 3.25,
        slidesToScroll: 1
    }
    
    useEffect(() => {
        dispatch(fetchHomes())
    }, [dispatch])

    return (
        <>
        
            <div id="homeindexitems-container">
                <div id="mainpage-homeindexheader">Trending Homes in Boston, MA</div>
                <div id="mainpage-homeindexsubheader">Likely to sell faster than 80% of homes nearby</div>
                <div id="mainpagehomeindex-slider">
                    <Slider {...sliderSettings}>
                            {homes.map(home => 
                                <div className='listingthumbnail'>
                                    <HomeIndexItem home={home}/>
                                </div>
                            )}
                    </Slider>
                </div>
                
            </div>
            <br></br>
        </>
    )
}



export default HomeIndex;