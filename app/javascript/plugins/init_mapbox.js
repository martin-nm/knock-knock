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
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
      const element = document.createElement('div');
        element.className = 'marker';
        element.style.backgroundImage = `url('${marker.image_url}')`;
        element.style.backgroundSize = 'contain';
        element.style.width = '30px';
        element.style.height = '30px';
      new mapboxgl.Marker(element)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(map);
    });

    fitMapToMarkers(map, markers, 13);
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
            builtMap.fitBounds(bounds, {maxZoom: 12});
          });
      });
    });
  });
};

export { initMapbox, initButtons };
