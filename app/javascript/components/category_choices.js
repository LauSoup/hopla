const formActive = () => { 
  const buttonForms = document.querySelectorAll(".category-choice");
  if (buttonForms) {
    buttonForms.forEach((buttonForm) => {
      buttonForm.addEventListener('click', (event) => {
        buttonForm.classList.toggle('active');
        console.log(buttonForm.querySelector('input'));
        if  (buttonForm.querySelector(".checkbox-categ").checked === true) {
          buttonForm.querySelector(".checkbox-categ").checked = false;
        } else {
          buttonForm.querySelector(".checkbox-categ").checked = true;
        };
      });
    });
  };
};

export {formActive}
