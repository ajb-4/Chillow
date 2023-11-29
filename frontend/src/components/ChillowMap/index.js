import { Map, GoogleApiWrapper, Marker } from 'google-maps-react';
import './ChillowMap.css'
import { useDispatch, useSelector } from "react-redux"
import { useEffect } from "react";
import { fetchHomes, getHomes } from "../../store/homes";


const apiKey = process.env.REACT_APP_GOOGLE_MAPS_API_KEY;

const ChillowMap = (props) => {
    const dispatch = useDispatch();
    const homes = useSelector(getHomes);

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
                          zoom={15}
                          initialCenter={{ lat: 40.73, lng: -73.99 }}
                          style={{ width: '800px', height: '800px'}}
                          center={{ lat: 40.73, lng: -73.99 }}
                        >
                            {homes.map((home) => (
                                <Marker
                                    key={home.id}
                                    position={{ lat: home.latitude, lng: home.longitude }}
                                />
                            ))}
                        </Map>
            </div>
        </>
    )
}

export default GoogleApiWrapper({
    apiKey: apiKey,
  })(ChillowMap);