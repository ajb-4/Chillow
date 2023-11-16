import { useDispatch, useSelector } from "react-redux";
import { fetchHome, getHome} from "../../store/homes";
import { useEffect, useState} from "react";
import './HomeShow.css'
import thumbnailphoto2 from '../../assets/images/Chillowimage5.jpeg'
import thumbnailphoto3 from '../../assets/images/ChillowImage6.jpeg'
import thumbnailphoto4 from '../../assets/images/ChillowImage7.jpeg'
import thumbnailphoto5 from '../../assets/images/ChillowImage8.jpeg'
import logo from '../../assets/images/ChillowFontLogo.png'
import { createLike, deleteLike } from "../../store/likes";


const HomeShow = ({homeId}) => {
    const dispatch = useDispatch();
    const home = useSelector(getHome(homeId));
    const [overviewTab, setOverviewTab] = useState(true);
    const [isExpanded, setIsExpanded] = useState(false);
    const [homeLiked, setHomeLiked] = useState();
    const sessionUser = useSelector(state => state.session.user);
    const likes = useSelector(state => state.likes);
    
    
    useEffect(() => {
        if (homeId) {
            dispatch(fetchHome(homeId))
        }
    }, [dispatch, homeId])

    useEffect(() => {
        const likesArray = Object.values(likes);
        if (likesArray.length > 0) {
            const hasLiked = likesArray.some(
                (like) => like.likerId === sessionUser.id && like.homeId === home.id
            );
            setHomeLiked(hasLiked);
        }
    }, [likes, home, sessionUser.id, dispatch]);

    let zestimate = '';
    let monthlyCost = '';
    let ppsf = '';

    const handleLike = () => {

        if (!sessionUser.id) {
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

    if (!home) {
        return null;
    }
    
    if (!home.price) {
        return null
    }
    else {
        zestimate = (home.price * 1.05).toLocaleString();
        monthlyCost = (home.price * 0.006).toLocaleString();
        ppsf = (home.price / home.squareFeet).toLocaleString();
    }

    const toggleExpand = () => {
        setIsExpanded(!isExpanded);
    }

    let heartIcon; 
    if (!homeLiked) {
        heartIcon = (<i class="fa-sharp fa-light fa-heart"></i>)
    } else {
        heartIcon = (<i class="fa-sharp fa-solid fa-heart"></i>)
    }

    return (
        <>
            <div id='homeshow-outtercontainer'>
                <div id='homeshow-imagecontainer'>
                    <img src={thumbnailphoto2} alt='mainpagehouse' id="homeshow-image"></img>
                    <img src={thumbnailphoto3} alt='mainpagehouse' id="homeshow-image"></img>
                    <img src={thumbnailphoto4} alt='mainpagehouse' id="homeshow-image"></img>
                    <img src={thumbnailphoto5} alt='mainpagehouse' id="homeshow-image"></img>
                    <img src={thumbnailphoto2} alt='mainpagehouse' id="homeshow-image"></img>
                    <img src={thumbnailphoto3} alt='mainpagehouse' id="homeshow-image"></img>
                    <img src={thumbnailphoto4} alt='mainpagehouse' id="homeshow-image"></img>
                    <img src={thumbnailphoto5} alt='mainpagehouse' id="homeshow-image"></img>
                    <img src={thumbnailphoto2} alt='mainpagehouse' id="homeshow-image"></img>
                    <img src={thumbnailphoto3} alt='mainpagehouse' id="homeshow-image"></img>
                    <img src={thumbnailphoto4} alt='mainpagehouse' id="homeshow-image"></img>
                    <img src={thumbnailphoto5} alt='mainpagehouse' id="homeshow-image"></img>
                </div>

                <div id='homeshow-detailscontainer'>
                    <div id='homeshow-headingtab'>
                        <img src={logo} alt="logo" id='homeshow-logo'></img>
                        <div id='homeshow-headerlink'>
                          <div id='homeshowheader-savehome' onClick={handleLike}>
                            {heartIcon}
                            <div>Save</div>
                          </div>
                          <div id='homeshowheader-sharehome'>Share</div> 
                        </div>
                    </div>
                    <div id='homeshow-detailscontainer-belowheader'>
                        <div id='homeshow-numnericaldetails'>
                            <div id='homeshow-price'>${home.price?.toLocaleString()}</div>
                            <div id='homeshow-bedsbathssqft'>
                                <div id='homeshowbeds'>
                                    <div className='boldedfont'>{home.bedrooms}</div> &nbsp;bds 
                                </div>
                                <div className='homeshowsepbars'>|</div>
                                <div id='homeshowbeds'>
                                    <div className='boldedfont'>{home.bathrooms}</div> &nbsp;ba 
                                </div>
                                <div className='homeshowsepbars'>|</div>
                                <div id="homeshowquarefeet">
                                    <div className='boldedfont'>{home.squareFeet?.toLocaleString()}</div> &nbsp;sqft
                                </div>
                            </div>
                        </div>
                        <div id='homeshowaddress'>
                            <div>{home.address},</div>
                            <div>{home.city},</div>
                            <div>{home.state}</div>
                            <div>{home.zipcode}</div>
                        </div>
                        <div id='homeshow-forsale'>
                            <div id='homeshow-redforsaledot'><i class="fa-solid fa-circle"></i></div>
                            <div id='homeshow-forsaletext'>For Sale</div>
                        </div>
                        <div id='homeshow-zestimate'>
                            <div id='homeshow-zestbar'>|</div>
                            <div id='homeshow-zestimatetext'>Chill-Estimate</div>
                            <div id='homeshow-zestimatevalue'>${zestimate}</div>
                        </div>
                        <div id='homeshow-monthlyestimate'>
                            <div id='homeshow-monthlyestimatetext'>Est.:</div>
                            <div id='homeshow-monthlyestimatevalue'>${monthlyCost}/mo</div>
                        </div>
                        <div id='homeshow-detailsmenu'>
                            <div id='homeshow-detailsmenu-overview' className={overviewTab ? 'clickedForm' : 'unclicked'}>
                                <button id="toggleto-overview" onClick={() => setOverviewTab(true)}>Overview</button>
                            </div>
                            <div id='homeshow-detailsmenu-facts' className={overviewTab ? 'unclicked' : 'clickedForm'}>
                                <button id="toggleto-facts" onClick={() => setOverviewTab(false)}>Facts and features</button>
                            </div>
                        </div>
                    </div>
                    <div id='homeshow-slideabledeatils'>
                        <div id='homeshow-quickfacts'>
                            <div id='homeshow-quickfacts-propertytype'>
                                <i class="fa-sharp fa-light fa-building"></i>
                                <div className="quickfacts-text">{home.propertyType}</div>
                            </div>
                            <div id='homeshow-quickfacts-builtdate'>
                                <i class="fa-light fa-calendar-days"></i>
                                <div className="quickfacts-text">Built in {home.builtDate}</div>
                            </div>
                            <div id='homeshow-quickfacts-lotsize'>
                                <i class="fa-sharp fa-light fa-chart-area"></i>
                                <div className="quickfacts-text">{home.lotSize} Acres</div>
                            </div>
                            <div id='homeshow-quickfacts-pricepersqft'>
                                <i class="fa-regular fa-ruler-combined"></i>
                                <div className="quickfacts-text">${ppsf} price/sqft</div>
                            </div>
                            <div id='homeshow-quickfacts-agencyfee'>
                                <i class="fa-sharp fa-light fa-circle-dollar"></i>
                                <div className="quickfacts-text">2.5% buyers agency fee</div>
                            </div>
                        </div>
                        <div id='homeshow-overview'>
                            <div id='homeshow-overviewtext'>Overview</div>
                            <div id={isExpanded ? 'homeshow-description-expanded' : 'homeshow-description'}>Soon Lara spotted another landmarks—an outcropping of limestone beside the path that had a silhouette like a man’s face, a marshy spot beside the river where the waterfowl were easily startled, a tall tree that looked like a man with his arms upraised. They were drawing near to the place where there was an island in the river. The island was a good spot to make camp. They would sleep on the island tonight.
Lara had been back and forth along the river path many times in her short life. Her people had not created the path—it had always been there, like the river—but their deerskin-shod feet and the wooden wheels of their handcarts kept the path well worn. Lara’s people were salt traders, and their livelihood took them on a continual journey.
At the mouth of the river, the little group of half a dozen intermingled families gathered salt from the great salt beds beside the sea. They groomed and sifted the salt and loaded it into handcarts. When the carts were full, most of the group would stay behind, taking shelter amid rocks and simple lean-tos, while a band of fifteen or so of the heartier members set out on the path that ran alongside the river.
With their precious cargo of salt, the travelers crossed the coastal lowlands and traveled toward the mountains. But Lara’s people never reached the mountaintops; they traveled only as far as the foothills. Many people lived in the forests and grassy meadows of the foothills, gathered in small villages. In return for salt, these people would give Lara’s people dried meat, animal skins, cloth spun from wool, clay pots, needles and scraping tools carved from bone, and little toys made of wood.</div>
                            <div id='toggleexpanddescription' onClick={toggleExpand}>{!isExpanded ? 'Show more' : 'Hide'}</div>
                            <div id='homepage-listingstats'>
                                <div id='homeshow-timeonzillow'>
                                    <div className='boldedfont'>Time</div> &nbsp; on Zillow
                                </div>
                                <div className='homeshowsepbars'>|</div>
                                <div id='homeshow-saves'>
                                    <div className='boldedfont'>3</div> &nbsp; saves
                                </div>
                            </div>
                        </div>
                        <div id='homeshow-factsandfeatures'>
                            <div id='factsandfeaturesheading'>Facts and features</div>
                            <div id='factsandfeaturesinterior'>
                                <div id='factsandfeaturesinteriorheading'>Interior</div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </>
    )

}

export default HomeShow;