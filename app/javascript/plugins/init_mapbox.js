import mapboxgl from 'mapbox-gl';

let userLatitude;
let userLongitude;
navigator.geolocation.getCurrentPosition((position) => {
  userLatitude = position.coords.latitude;
  userLongitude = position.coords.longitude;
});
console.log(userLatitude, userLongitude)

const initMapbox = () => {
  var x = window.matchMedia("(max-width: 420px)");
  var mapDiv = "map1";

  var mapElement = document.getElementById('map1');
  if (x.matches) { // If media query matches
    // console.log(x)
    mapElement = document.getElementById('map2');
    mapDiv = "map2";
  }
  // const mapElement = document.getElementById('map');
  const fitMapToMarkers = (map, markers) => {
    console.log('fitMapToMarkers')

    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 12, duration: 0 });
    map.flyTo({center: [markers[0].lng, markers[0].lat]})
  };

  const centerMapToUserLocation = (map) => {
    console.log('centerMapToUserLocation')

    let userLatitude;
    let userLongitude;
    navigator.geolocation.getCurrentPosition((position) => {
      userLatitude = position.coords.latitude;
      userLongitude = position.coords.longitude;
    });
    const bounds = new mapboxgl.LngLatBounds();
    map.flyTo({center: [userLongitude, userLatitude]})
  }

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: mapDiv,
      style: 'mapbox://styles/alexk02/ck3ot2rfb6udw1cmz6awv1prg'
    });


    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {

      const element = document.createElement('div');
      element.className = 'marker';

      element.style.width = '14px';
      element.style.height = '33px';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'cover';
      // element.style.objectFit

      new mapboxgl.Marker(element)
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(map);
    });

    if (userLatitude != undefined && userLongitude != undefined) {
      centerMapToUserLocation(map);
    } else {
      fitMapToMarkers(map, markers);
    }
  }
};


export { initMapbox };
