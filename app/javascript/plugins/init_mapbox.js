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

    });


    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
                                          mapboxgl: mapboxgl }));

    const geolocMe = (zoom) => {
      navigator.geolocation.getCurrentPosition(e => {
      const latitude = e.coords.latitude;
      const longitude = e.coords.longitude;
      console.log(latitude, longitude)
      new mapboxgl.Marker()
        .setLngLat([ longitude, latitude ])
        .addTo(map);

      fitMapToMarkers(map, [{lng: longitude, lat: latitude}], zoom)
      });
    };


    fitMapToMarkers(map, markers, 14);
    openInfoWindow(mapMarkers);

    // const marker = document.querySelector('.mapboxgl-marker-anchor-center');
    // marker.addEventListener('click', (event) => {
    //   const userCard = document.querySelector(`.user-${userId}`);
    //   console.log(userCard.style.backgroundColor="orange");
    // });

    // document.querySelector('#localize').addEventListener('click', (event) => {
      // geolocMe(13);
      // Call ajax vers l'index avec comme params latitude, longitude, range

      // Dans l'action index du controller
      // Si j'ai des params latitude et longitude, alors filtrer les users dans l'index avec la méthode .near

      // Dans la vue js.erb, render les cards filtrées
    // });

    // Au click sur le bouton 5km
    // J'appelle geolocMe(13)
    //
  }
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

export { initMapbox };

// faire un bouton pour ecouter l event, geoloc a ce moment la, recup la long et lat
// puis les donner à un marker appelé my marker et fiter la mpa sur ce marker























