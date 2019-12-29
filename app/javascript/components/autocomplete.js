const autocomplete = () => {
  document.addEventListener("DOMContentLoaded", function() {
    var cityName = document.getElementById('city_input');

    if (cityName) {
      var autocomplete = new google.maps.places.Autocomplete(cityName, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(cityName, 'keydown', e => {
        console.log(autocomplete)
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
