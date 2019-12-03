import "jquery-bar-rating";
import "jquery-bar-rating/dist/themes/fontawesome-stars.css";
// import $ from 'jquery'; // <-- if you're NOT using a Le Wagon template (cf jQuery section)

const initStarRating = () => {
  $('#checkin_rating').barrating({
    theme: 'fontawesome-stars'
  });
};

export { initStarRating };
