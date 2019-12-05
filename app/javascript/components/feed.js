const choppeCardsForFeed = () => {
  const cards = document.querySelectorAll(".card-post");
  cards.forEach((card) => {
    card.addEventListener('mouseenter', (event) => {
      card.lastElementChild.firstElementChild.style.display = "block";
    });
    card.addEventListener('mouseleave', (event) => {
      card.lastElementChild.firstElementChild.style.display = "none";
    });
  })
};

export { choppeCardsForFeed };
