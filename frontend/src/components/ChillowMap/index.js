import { Map, GoogleApiWrapper, Marker, InfoWindow } from 'google-maps-react';
import './ChillowMap.css'
import { useDispatch, useSelector } from "react-redux"
import { useEffect } from "react";
import { fetchHomes, getHomes } from "../../store/homes";
import { getFilters } from '../../store/filter';
import { useHistory } from 'react-router-dom';


const apiKey = process.env.REACT_APP_GOOGLE_MAPS_API_KEY;

const ChillowMap = (props) => {
    const dispatch = useDispatch();
    const homes = useSelector(getHomes);
    const filteredHomes = useSelector(getFilters)
    const history = useHistory();

    useEffect(() => {
        dispatch(fetchHomes());
    }, [dispatch]) 
    // const [map, setMap] = useState(null);
    // const mapRef = useRef(null);
 
    const formatPrice = (price) => {
        if (price >= 1000) {
            return `${(price / 1000).toFixed()}k`;
        }
        return price.toString();
    };

    return (
        <>
            <div id='chillowmap-outtercontainer'>
                <Map
                    google={props.google}
                    zoom={7}
                    initialCenter={{ lat: 44, lng: -72 }}
                    style={{ width: 'calc(100vw - 740px)', height: '85vh'}}
                    center={{ lat: 44, lng: -72 }}
                >
                    {filteredHomes.length > 0 ? (
                        filteredHomes.map((home) => (
                            <Marker
                                key={home.id}
                                position={{ lat: home.latitude, lng: home.longitude }}
                                onClick={() => history.push(`/homes/${home.id}`)}
                                label={home.price ? formatPrice(home.price) : ""}
                                id="mapmarker"
                            />
                        ))
                    ) : (
                        homes.map((home) => (
                            <Marker
                                key={home.id}
                                position={{ lat: home.latitude, lng: home.longitude }}
                                onClick={() => history.push(`/homes/${home.id}`)}
                                label={home.price ? formatPrice(home.price) : ""}
                                id="mapmarker"
                            />
                        ))
                    )}
                </Map>
            </div>
        </>
    )
}

export default GoogleApiWrapper({
    apiKey: apiKey,
  })(ChillowMap);