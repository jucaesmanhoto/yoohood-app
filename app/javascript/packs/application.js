import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import flash from "../components/flashes"
import { previewImageOnFileSelect } from '../components/picture_preview';
import { initMapbox } from '../plugins/init_mapbox';


initMapbox();
previewImageOnFileSelect();
