import { Link, Route, useHistory} from 'react-router-dom';
import { Carousel } from 'react-responsive-carousel';
import 'react-responsive-carousel/lib/styles/carousel.min.css';
import './HomeIndexItem.css'
import { useDispatch, useSelector } from 'react-redux';
import { useState, useEffect } from 'react';
import { fetchLikes, createLike, deleteLike } from '../../store/likes';




const HomeIndexItem = ({home}) => {


    const history = useHistory();
    const dispatch = useDispatch();
    const [homeLiked, setHomeLiked] = useState();
    const sessionUser = useSelector(state => state.session.user);
    const likes = useSelector(state => state.likes);

    // const handleClick = () => {
    //     setIsOpen(true);
    //     history.push(`/homes/${home.id}`);
    // }

    useEffect(() => {

        if (sessionUser) {
            const likesArray = Object.values(likes);

            if (likesArray.length > 0) {
                const hasLiked = likesArray.some(
                    (like) => like.likerId === sessionUser.id && like.homeId === home.id
                );
                setHomeLiked(hasLiked);
            } else {
                setHomeLiked(false);
            }
        }
    }, [likes, home.id, dispatch]);
    
    
    if (!home || !home.photoArray) {
        return null;
    }

    const images = home.photoArray;

    const handleClick = (e) => {
        if (e.target.classList[0] !== "dot" && e.target.classList[0] !== "control-arrow") {
            history.push(`/homes/${home.id}`)
        }
    }

    const handleLike = (e) => {

        e.stopPropagation();

        if (!sessionUser) {
            return;
        }
        const likesArray = Object.values(likes);

        if (!homeLiked) {
            setHomeLiked(true)
            dispatch(createLike({
                likerId: sessionUser.id,
                homeId: home.id
            }))
        } else {
            setHomeLiked(false);

            const likeId = likesArray.find(
                (like) => like.likerId === sessionUser.id && like.homeId === home.id
            )?.id;

            if (likeId) {
                dispatch(deleteLike(likeId));
            }
        }
    }


    return (

        <>  
            {/* <Link to={`/homes/${home.id}`} className="no-link-underline"> */}
            <div id="homeindexitem-outtercontainer" onClick={handleClick}>
               
                <div id='homeindexitem-heart' onClick={handleLike}>
                    <div id='homeindexitemheart-border'>
                        <i class="fa-regular fa-heart"></i>
                    </div>
                    <div id={homeLiked ? 'homeindexitemheart-container-white' : 'homeindexitemheart-container'}>
                        <i class="fa-sharp fa-solid fa-heart"></i>
                    </div>
                </div>
                <div style={{ width: "100%", height: "100%"}}>
                    <div id='thumbnailphoto-carousel' className='test'>
                        <Carousel>
                            {images.map((photo, index) => (
                                <img key={index} src={photo} alt={`Photo ${index}`} id='thumbnailphoto'/>
                            ))}
                        </Carousel>
                    </div>
                    <div id='homeindexitemdetail-container'>
                        <div id='homeindexitemprice-container'>
                            <div id='homeindexitemprice'>${home.price?.toLocaleString()}</div>
                        </div>
                        <div id='indexitem-numericaldetails'>
                            <div id='homeindexitembeds'>{home.bedrooms} bds</div>
                            <div className='homeindexsepbars'>|</div>
                            <div id='homeindexitembeds'>{home.bathrooms} ba</div>
                            <div className='homeindexsepbars'>|</div>
                            <div id="homeindexitemsquarefeet">{home.squareFeet?.toLocaleString()} sqft</div>
                            <div className='homeindexsepbars'>|</div>
                            <div>Active</div>
                        </div>
                        <div id='homeindexitemaddress'>
                            <div>{home.address},</div>
                            <div>{home.city},</div>
                            <div>{home.state}</div>
                            <div>{home.zipcode}</div>
                        </div>
                            {/* <Link to={`/homes/${home.id}`}>Link to Show</Link> */}
                            {/* <ShowModal open={isOpen} onClose={() => setIsOpen(false)} modalStyle='homeShowModalStyle'>
                                    <HomeShow homeId={home.id}/>
                            </ShowModal> */}
                    </div>
                    </div>
            </div>
            {/* </Link> */}
        </>
    )

}

export default HomeIndexItem;