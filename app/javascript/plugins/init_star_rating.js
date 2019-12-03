import "jquery-bar-rating";
import "jquery-bar-rating/dist/themes/fontawesome-stars.css";

const initStarRating = () => {
  $('#checkin_rating').barrating({
    theme: 'fontawesome-stars'
  });
};

export { initStarRating };
