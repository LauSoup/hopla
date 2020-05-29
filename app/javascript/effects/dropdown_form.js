const dropdownForm = () => {
  const dropdownButton = document.getElementById("refine-button");
  const researchContainer = document.querySelectorAll(".research-container")
  console.log(dropdownButton);
  console.log(researchContainer[0].classList);
  dropdownButton.addEventListener("click", (event) => {
    console.log(event);
    const form = document.getElementById("search-form-home");
    form.classList.toggle("d-none");


  });
};
export { dropdownForm }
