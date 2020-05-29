import flatpickr from "flatpickr";

flatpickr(".datepicker", {
  disableMobile: "true",
  altInput: true,
  enableTime: true,
  dateFormat: "d-m-Y",
  minDate: "today",
});
