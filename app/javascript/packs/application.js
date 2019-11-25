import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initPicturePreview } from '../components/picture_preview';
import { initMapbox } from '../plugins/init_mapbox';


initMapbox();
initPicturePreview();
