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


input.addEventListener('focus', (event) => {
  console.log("marche");
  input.addEventListener('keypress', (e) => {
    if (e.key === "Enter") {
      submit.click();
    }
  })
});
