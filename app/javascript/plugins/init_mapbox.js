import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  const fitMapToMarkers = (map, markers, zoom) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: zoom, duration: 0 });
  };

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/outdoors-v10'
    });

    const markers = JSON.parse(mapElement.dataset.markers);
    const mapMarkers = [];

    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
      const element = document.createElement('div');
        element.className = 'marker';
        element.style.backgroundImage = `url('${marker.image_url}')`;
        element.style.backgroundSize = 'contain';
        element.style.width = '30px';
        element.style.height = '30px';
      const newMarker = new mapboxgl.Marker(element)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(map);
      mapMarkers.push(newMarker)
      // We use the "getElement" funtion provided by mapbox-gl to access to the marker's HTML an set an id
      newMarker.getElement().dataset.markerId = marker.id;
      // Put a microphone on the new marker listening for a mouseenter event
      newMarker.getElement().addEventListener('mouseenter', (e) => toggleCardHighlighting(e) );
      // We put a microphone on listening for a mouseleave event
      newMarker.getElement().addEventListener('mouseleave', (e) => toggleCardHighlighting(e) );

      new mapboxgl.Marker(element)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(map);
    });

    fitMapToMarkers(map, markers, 13);
    openInfoWindow(mapMarkers);

    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
                                          mapboxgl: mapboxgl }));

    return map;
  };
};

const initButtons = () => {
  document.querySelectorAll('.localize').forEach((element) => {
    const range = element.getAttribute("data-range");
    element.addEventListener('click', (event) => {
      navigator.geolocation.getCurrentPosition(e => {
        const latitude = e.coords.latitude;
        const longitude = e.coords.longitude;
        fetch(`/users?onlyUsers=1&latitude=${latitude}&longitude=${longitude}&range=${range}`).
          then(response => response.json()).
          then(data => {
            document.getElementById("map_and_list").innerHTML = data.html;
            const builtMap = initMapbox();
            new mapboxgl.Marker()
              .setLngLat([ longitude, latitude ])
              .addTo(builtMap);
            const bounds = new mapboxgl.LngLatBounds();
            bounds.extend([ longitude, latitude ])
            builtMap.fitBounds(bounds, { padding: 70, maxZoom: zoom, duration: 0 });
          });
      });
     });
 });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const openInfoWindow = (markers) => {
  // Select all cards
  const cards = document.querySelectorAll('.card-index-user');
  cards.forEach((card, index) => {
    // Put a microphone on each card listening for a mouseenter event
    card.addEventListener('mouseenter', () => {
      // Here we trigger the display of the corresponding marker infoWindow with the "togglePopup" function provided by mapbox-gl
      markers[index].togglePopup();
    });
    // We also put a microphone listening for a mouseleave event to close the modal when user doesn't hover the card anymore
    card.addEventListener('mouseleave', () => {
      markers[index].togglePopup();
    });
  });
}

const toggleCardHighlighting = (event) => {
  // We select the card corresponding to the marker's id
  const card = document.querySelector(`[data-user-id="${event.currentTarget.dataset.markerId}"]`);
  // Then we toggle the class "highlight github" to the card
  card.classList.toggle('highlight');
}

export { initMapbox, initButtons };
