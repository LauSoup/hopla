import flatpickr from "flatpickr";

const flatpickMethod = () => {
  flatpickr(".datepicker", {
    disableMobile: "true",
  });
};

export { flatpickMethod }