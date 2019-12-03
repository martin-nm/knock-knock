import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["interact with co-workers", "get help from experts"],
    typeSpeed: 60,
    loop: true,
    showCursor: false,
  });
}

export { loadDynamicBannerText };
