import GMaps from 'gmaps/gmaps.js';
import { autocomplete } from '../components/autocomplete';

const mapElement = document.getElementById('gmap');

function getLocation() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition);
  } else {
    console.log("Geolocation is not supported by this browser.");
  }
}

function showPosition(position) {
  if (mapElement) { // don't try to build a map if there's no div#map to inject in
    const map = new GMaps({ el: '#gmap', lat: position.coords.latitude, lng: position.coords.longitude });
    // const markers = JSON.parse(mapElement.dataset.markers);
    // map.addMarkers(markers);
    // if (markers.length === 0) {
    //   map.setZoom(2);
    // } else if (markers.length === 1) {
    //   map.setCenter(markers[0].lat, markers[0].lng);
    //   map.setZoom(14);
    // } else {
    //   map.fitLatLngBounds(markers);
    // }
  }
}

getLocation();
autocomplete();
