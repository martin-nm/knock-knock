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
  input.addEventListener('keypress', (e) => {
    if (e.key === "Enter") {
  console.log("marche");
      submit.click();
    }
  })
});

// function scrollToBottom(){
//   const messages = document.querySelector('.messages-container');
//   const chatcontainer = document.querySelector('.chat-container');
//   messages.scrollTop = chatcontainer.offsetTop - 10;
// }

// scrollToBottom();
// setInterval(scrollToBottom, 1000);

