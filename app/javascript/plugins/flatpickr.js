import flatpickr from "flatpickr";

const flatpickMethod = () => {
  flatpickr(".datepicker", {
    enableTime: true,
    dateFormat: "d-m-Y",
    minDate: "today",
  });
};

export { flatpickMethod }
