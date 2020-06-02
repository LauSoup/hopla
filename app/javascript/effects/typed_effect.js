import Typed from 'typed.js';

var options = {
  strings: ['des bons plans...', 'des petits prix...', 'un commerce...', 'une bijouterie...',
  'un fleuriste...', 'une quincaillerie...',
  'une galerie d\'art...', 'une boulangerie...', 'un café...', 'un salon de beauté...', 'une épicerie...'],
  typeSpeed: 80,
  startDelay: 0,
  backSpeed: 50,
  smartBackspace: true,
  backDelay: 600,
  loop: true,
  loopCount: Infinity,
  showCursor: true,
  cursorChar: '|',
};

const typedMethod = () => {
  const refineButton = document.querySelector(".typed-element");
  console.log(refineButton)
  if (refineButton) {
    var typed = new Typed('.typed-element', options);
  };
};

export { typedMethod }
