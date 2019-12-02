import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { loadDynamicBannerText } from '../components/banner';
import { initMapbox } from '../plugins/init_mapbox';
import { initChat } from '../components/chat';

initMapbox();
initChat();

if (document.querySelector('#banner-typed-text')) {
  loadDynamicBannerText();
}

const input = document.querySelector('#message_text');
const submit = document.querySelector('#submit-button');


if (document.querySelector('focus')) {
    input.addEventListener('focus', (event) => {
    input.addEventListener('keypress', (e) => {
      if (e.key === "Enter") {
        submit.click();
      }
    })
  });
};



// const marker = document.querySelector('.mapboxgl-marker-anchor-center');
// marker.addEventListener('click', (event) => {
//   const userCard = document.querySelector('.user-11');
//   console.log(userCard.style.backgroundColor="");
// });
