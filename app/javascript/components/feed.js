const animateOnBombClick = () => {
  const cards = document.querySelectorAll(".for-animation");
  cards.forEach((card) => {
    const bomb = card.querySelector('#bomb');
    // bomb.addEventListener('click', (event) => {
    //   event.preventDefault();
    //   setTimeout(() => {console.log("ok")}, 2000);
    //   setTimeout(() => {console.log("hello")}, 4000);
    // });

  })
};

export { animateOnBombClick };
