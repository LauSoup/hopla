import flatpickr from "flatpickr";

const flatpickMethod = () => {
  flatpickr(".datepicker", {
    disableMobile: "true",
    altInput: true,
    enableTime: true,
    dateFormat: "d-m-Y",
    minDate: "today",
  });
};

export { flatpickMethod }
