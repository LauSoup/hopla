import Typed from 'typed.js';

var options = {
  strings: ['une chocolaterie.', 'un restaurant.', 'un salon de coiffure.', 'une bijouterie.',
  'une fleuristerie.', 'une pharmacie.', 'une quincaillerie.',
  'une galerie d\'art.', 'une boulangerie.', 'un café.', 'un salon de beauté.', 'une épicerie.'],
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
  var typed = new Typed('.typed-element', options);
};  

export { typedMethod }
