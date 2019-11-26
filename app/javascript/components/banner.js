import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Interract with co-workers", "get help from experts"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
