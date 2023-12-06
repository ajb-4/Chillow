import { Map, GoogleApiWrapper, Marker } from 'google-maps-react';
import './ChillowMap.css'
import { useDispatch, useSelector } from "react-redux"
import { useEffect } from "react";
import { fetchHomes, getHomes } from "../../store/homes";
import { getFilters } from '../../store/filter';


const apiKey = process.env.REACT_APP_GOOGLE_MAPS_API_KEY;

const ChillowMap = (props) => {
    const dispatch = useDispatch();
    const homes = useSelector(getHomes);
    const filteredHomes = useSelector(getFilters)

    useEffect(() => {
        dispatch(fetchHomes());
    }, [dispatch]) 
    // const [map, setMap] = useState(null);
    // const mapRef = useRef(null);
    

    return (
        <>
            <div id='chillowmap-outtercontainer'>
                <Map
                    google={props.google}
                    zoom={4}
                    initialCenter={{ lat: 40.73, lng: -73.99 }}
                    style={{ width: '800px', height: '800px'}}
                    center={{ lat: 40, lng: -102 }}
                >
                    {filteredHomes.length > 0 ? (
                        filteredHomes.map((home) => (
                            <Marker
                                key={home.id}
                                position={{ lat: home.latitude, lng: home.longitude }}
                            />
                        ))
                    ) : (
                        homes.map((home) => (
                            <Marker
                                key={home.id}
                                position={{ lat: home.latitude, lng: home.longitude }}
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