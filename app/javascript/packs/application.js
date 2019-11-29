import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { loadDynamicBannerText } from '../components/banner';
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { initChat } from '../components/chat';

initMapbox();
initAutocomplete();
initChat();


if (document.querySelector('#banner-typed-text')) {
  loadDynamicBannerText();
}

const input = document.querySelector('#message_text');
const submit = document.querySelector('#submit-button');


input.addEventListener('focus', (event) => {
  input.addEventListener('keypress', (e) => {
    if (e.key === "Enter") {
  console.log("marche");
      submit.click();
    }
  })
});
