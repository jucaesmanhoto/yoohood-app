import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import flash from "../components/flashes"
import "../plugins/flatpickr"
import { previewImageOnFileSelect } from '../components/picture_preview';
// import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';
import "../components/category_checkboxes";
import { initScroll } from "../components/scroll_to_anchor";
import { initStarRating } from '../plugins/init_star_rating';
// import { scrollLastMessageIntoView } from '../components/scroll_to_last_message';

previewImageOnFileSelect();
// initMapbox();
initAutocomplete();
initScroll();
initStarRating();
// scrollLastMessageIntoView();

$(document).ready(function(){
  var clipboard = new Clipboard('#invite-link');
});

window.addEventListener("load",function() {
  setTimeout(function(){
      // This hides the address bar:
      window.scrollTo(0, 1);
  }, 0);
});
