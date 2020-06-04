const multipleFormShop = () => {
  const step1 = document.querySelector(".form-step-1");
  const step2 = document.querySelector(".form-step-2");
  const step3 = document.querySelector(".form-step-3");
  const title = document.querySelector(".title-steps");
  const button1 = document.querySelector("#step1-button");
  const button2 = document.querySelector("#step2-button");
  const returnButtonStep2 = document.querySelector("#button-return-step2");
  const returnButtonStep3 = document.querySelector("#button-return-step3");

  if (step1) {
    button1.addEventListener("click", (event) => {
      step1.style.transform = "translateY(calc(-100% - 130px))";
      step1.style.transition = "transform 0.5s";
      step2.style.transform = "translateY(-100%)";
      step2.style.transition = "transform 0.7s";
      title.innerHTML = "Catégorie(s) de la boutique";
    });
    button2.addEventListener("click", (event) => {
      step2.style.transform = "translateY(calc(-200% - 130px))";
      step2.style.transition = "transform 0.5s";
      step3.style.transform = "translateY(-200%)";
      step3.style.transition = "transform 0.7s";
      title.innerHTML = "Finalisation";
    });
    returnButtonStep2.addEventListener("click", (event) => {
      step1.style.transform = "translateY(0)";
      step2.style.transform = "translateY(0)";
      title.innerHTML = "Informations de la boutique";
    });
    returnButtonStep3.addEventListener("click", (event) => {
      step2.style.transform = "translateY(-100%)";
      step3.style.transform = "translateY(0)";
      title.innerHTML = "Catégorie(s) de la boutique";
    });
  };
};

const multipleFormEvent = () => {
  const step1Event = document.querySelector(".form-step-1-event");
  const step2Event = document.querySelector(".form-step-2-event");
  const button1Event = document.querySelector("#step1-event-button");
  const returnButtonStep2Event = document.querySelector("#button-return-event-step2");

  if (step1Event) {
    button1Event.addEventListener("click", (event) => {
      step1Event.style.transform = "translateY(calc(-100% - 130px))";
      step1Event.style.transition = "transform 0.5s";
      step2Event.style.transform = "translateY(-100%)";
      step2Event.style.transition = "transform 0.7s";
    });
    returnButtonStep2Event.addEventListener("click", (event) => {
      step1Event.style.transform = "translateY(0)";
      step2Event.style.transform = "translateY(0)";
    });
  };
};

export { multipleFormShop }
export { multipleFormEvent }