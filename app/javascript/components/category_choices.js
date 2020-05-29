const formActive = () => { 
  const buttonForms = document.querySelectorAll(".category-choice");
  if (buttonForms) {
    buttonForms.forEach((buttonForm) => {
      buttonForm.addEventListener('click', (event) => {
        buttonForm.classList.toggle('active');
      });
    });
  };
};

export {formActive}
