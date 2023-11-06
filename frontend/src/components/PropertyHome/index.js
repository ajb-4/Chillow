import React, { useEffect, useState } from "react";
import { useParams, useHistory} from "react-router-dom";
import ShowModal from "../../ShowModal";
import HomeShow from "../HomeShow";
import './PropertyHome.css'
import PropertyHomeIndex from "../PropertyHomeIndex";
import CreateSearch from "../CreateSearch";
import GoogleMaps from '../../assets/images/GoogleMapsSS.png';
import ChillowMap from "../ChillowMap";

const PropertyHome = () => {
    const {homeId} = useParams();
    const [isOpen, setIsOpen] = useState(true);
    const history = useHistory();

    const setClose = () => {
      setIsOpen(false);
      history.push('/homes');
    }
  
    useEffect(() => {
      setIsOpen(true);
    }, [homeId])

    return (
      <>
      <div id='propertyhome-searchcontainer'>
          <CreateSearch/>
      </div>
      <div id='propertyhome-mapandindexcontainer'>
        <div id='properrtyhome-mapcontainer'>
          <div id='prophome-map'>
            <ChillowMap/>
          </div>
        </div>
        <div id='propertyhome-indexcontainer'>
          <div id='propertyhome-indexheader'>Chill Real Estate and Homes for Sale</div>
          <div id='propertyhome-indexgrid'>
            <PropertyHomeIndex/>
          </div>
        </div>


      </div>
      {/* render the home index here */}
      {homeId && <ShowModal open={isOpen} onClose={setClose} modalStyle='homeShowModalStyle'>
        <HomeShow homeId={homeId}/>
      </ShowModal>}
      </>
    )
  }

export default PropertyHome;