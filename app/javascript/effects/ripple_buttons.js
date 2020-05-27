const rippleButtons = () => {
  const buttons = document.querySelectorAll(".ripple");
  buttons.forEach(btn => {
    btn.addEventListener('click', ripple);
  })
};


function ripple(event) {
  const el = event.currentTarget;

  const rippleEl = document.querySelector('span.ripple');
  if(!rippleEl) {
    rippleEl = document.createElement('span');
  }
  el.appendChild(rippleEl);

  const max = Math.max(el.offsetWidth, el.offsetHeight);
  rippleEl.style.width = rippleEl.style.height = max + 'px';
  rippleEl.classList.add('ripple');
};

export { rippleButtons } 
