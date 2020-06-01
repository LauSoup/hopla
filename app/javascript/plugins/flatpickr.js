import flatpickr from "flatpickr";

const flatpickMethod = () => {
  flatpickr(".datepicker", {
    altInput: true,
    enableTime: true,
    dateFormat: "d-m-Y",
    minDate: "today",
    defaultDate: true,
  });
};

export { flatpickMethod }
