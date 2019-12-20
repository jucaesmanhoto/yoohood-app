import GMaps from 'gmaps/gmaps.js';
import { autocomplete } from '../components/autocomplete';

const mapElement = document.getElementById('gmap');

const getLocation = () => {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition);
  } else {
    console.log("Geolocation is not supported by this browser.");
  }
}

const showPosition = (position) => {
  const latitudeInput = document.getElementById('latitude-input');
  const longitudeInput = document.getElementById('longitude-input');
  document.getElementById('nearby-button').classList.remove('d-none')
  latitudeInput.value = position.coords.latitude;
  longitudeInput.value = position.coords.longitude;
  console.log(position.coords.latitude, position.coords.longitude);
  
  if (mapElement) { // don't try to build a map if there's no div#map to inject in
    if (window.location.pathname.split('/').pop() == 'nearby') {
      document.getElementById('nearby-button').classList.add('d-none')
    }
    const map = new GMaps({ el: '#gmap', lat: position.coords.latitude, lng: position.coords.longitude });
    const markers = JSON.parse(mapElement.dataset.markers);    
    map.addMarkers(markers);
    if (markers.length === 0) {
      map.setZoom(2);
    } else if (markers.length === 1) {
      map.setCenter(markers[0].lat, markers[0].lng);
      map.setZoom(14);
    } else {
      map.fitLatLngBounds(markers);
    }
  }
}

getLocation();
autocomplete();
