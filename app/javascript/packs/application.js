import "bootstrap";
import "animate.css/animate.min.css";

import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { loadDynamicBannerText } from '../components/banner';
import { initMapbox, initButtons } from '../plugins/init_mapbox';
import { initChat } from '../components/chat';
import { choppeCardsForFeed } from '../components/feed';

initMapbox();
initButtons();
initChat();
choppeCardsForFeed();

if (document.querySelector('#banner-typed-text')) {
  loadDynamicBannerText();
}

const input = document.querySelector('#message_text');
const submit = document.querySelector('#submit-button');


if (document.querySelector(".chatroom")) {
  input.addEventListener('focus', (event) => {
    input.addEventListener('keypress', (e) => {
      if (e.key === "Enter") {
        console.log("marche");
        submit.click();
      }
    })
  })
};
