const multipleForm = () => {
  const step1 = document.querySelector(".step1");
  const step2 = document.querySelector(".step2");
  const step3 = document.querySelector(".step3");
  const title = document.querySelector(".title-steps");
  const button1 = document.querySelector("#step1-button");
  const button2 = document.querySelector("#step2-button");
  const returnButtonStep2 = document.querySelector("#button-return-step2");
  const returnButtonStep3 = document.querySelector("#button-return-step3");

  if (step1) {
    button1.addEventListener("click", (event) => {
      step1.style.transform = "translateY(-100%)";
      step1.style.transition = "transform 0.5s";
      step2.style.transform = "translateY(-100%)";
      step2.style.transition = "transform 0.7s";
      title.innerHTML = "Catégorie(s) de la boutique";
    });
    button2.addEventListener("click", (event) => {
      step2.style.transform = "translateY(-200%)";
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

export { multipleForm }