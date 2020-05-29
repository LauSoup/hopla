const dropdownForm = () => {
  const dropdownButton = document.getElementById("refine-button");
  if (dropdownButton) {
    console.log(dropdownButton);
    dropdownButton.addEventListener("click", (event) => {
      const form = document.getElementById("search-form-home");
      form.classList.toggle("d-none");
      if (dropdownButton.innerHTML === "<i class=\"fas fa-chevron-down\"></i> Filtrer") {
        dropdownButton.innerHTML = "<i class=\"fas fa-chevron-up\"></i> Filtrer";
      } else {
        dropdownButton.innerHTML = "<i class=\"fas fa-chevron-down\"></i> Filtrer";
      }
    });
  };
};
export { dropdownForm }
