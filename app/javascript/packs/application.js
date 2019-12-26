import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import flash from "../components/flashes"
import "../plugins/flatpickr"
import { previewImageOnFileSelect } from '../components/picture_preview';
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';
import "../components/category_checkboxes";
import { initScroll } from "../components/scroll_to_anchor";
import { initStarRating } from '../plugins/init_star_rating';

previewImageOnFileSelect();
initMapbox();
initAutocomplete();
initScroll();
initStarRating();

$(document).ready(function(){  
  var clipboard = new Clipboard('#invite-link');
  console.log(clipboard);
});

setTimeout(() => { window.scrollTo(0, 1) }, 100);
