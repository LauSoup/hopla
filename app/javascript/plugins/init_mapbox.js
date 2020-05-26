import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';


const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v11'
  });
};

const AddSearchToMap = (map) => {
  map.addControl(
    new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl })
  );
};

// const addMarkersToMap = (map, markers) => {
//   markers.forEach((marker) => {
//     const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
//     const element = document.createElement('div');
//     element.className = 'marker';
//     element.style.backgroundImage = `url('${marker.image_url}')`;
//     element.style.backgroundSize = 'cover';
//     element.style.width = '20px';
//     element.style.height = '30px';
//     new mapboxgl.Marker(element)
//       .setLngLat([ marker.lng, marker.lat ])
//       .setPopup(popup)
//       .addTo(map);
//   });
// };

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  console.log(mapElement);
  if (mapElement) {
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(map);
    });
      map.addControl(
      new MapboxGeocoder({
        accessToken: mapboxgl.accessToken,
        mapboxgl: mapboxgl })
    );
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
    AddSearchToMap(map);
  }
};

export { initMapbox };


// const addMarkersToMap = (map, markers) => {
//   markers.forEach((marker) => {
//     const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
//     const element = document.createElement('div');
//     element.className = 'marker';
//     element.style.backgroundImage = `url('${marker.image_url}')`;
//     element.style.backgroundSize = 'cover';
//     element.style.width = '20px';
//     element.style.height = '30px';
//     new mapboxgl.Marker(element)
//       .setLngLat([ marker.lng, marker.lat ])
//       .setPopup(popup)
//       .addTo(map);
//   });
// };


// const initMapbox = () => {
//   const mapElement = document.getElementById('map');

//   if (mapElement) { // only build a map if there's a div#map to inject into
//     mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
//     const map = new mapboxgl.Map({
//       container: 'map',
//       style: 'mapbox://styles/mapbox/streets-v11'
//     });

//     const markers = JSON.parse(mapElement.dataset.markers);
//   markers.forEach((marker) => {
//     new mapboxgl.Marker()
//       .setLngLat([ marker.lng, marker.lat ])
//       .addTo(map);
//   });
//   }
//   mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
//   const map = new mapboxgl.Map({
//   container: 'map',
//   style: 'mapbox://styles/mapbox/streets-v11',
//   center: [-1.6777926, 48.117266],
//   zoom: 13
//   });

//   map.addControl(
//     new MapboxGeocoder({
//       accessToken: mapboxgl.accessToken,
//       mapboxgl: mapboxgl })
//   );
//   addMarkersToMap(map, markers);
//   fitMapToMarkers(map, markers);
// };

// const fitMapToMarkers = (map, markers) => {
//   const bounds = new mapboxgl.LngLatBounds();
//   markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
//   map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
// };

// export { initMapbox };
