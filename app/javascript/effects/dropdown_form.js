const dropdownForm = () => {
  const dropdownButton = document.getElementById("refine-button");
  console.log(dropdownButton);
  dropdownButton.addEventListener("click", (event) => {
    console.log(event);
    const form = document.getElementById("search-form-home");
    form.classList.toggle("d-none");
  });
};
export { dropdownForm }
