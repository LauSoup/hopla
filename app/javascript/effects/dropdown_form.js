const dropdownForm = () => {
  const dropdownButton = document.getElementById("refine-button");
  if (dropdownButton) { 
    dropdownButton.addEventListener("click", (event) => {
      const form = document.getElementById("search-form-home");
      form.classList.toggle("d-none");
    });
  };
};
export { dropdownForm }
