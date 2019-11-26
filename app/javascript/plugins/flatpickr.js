import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"

flatpickr(".datepicker", {
  format: "d-m-Y",
  altFormat: "d-m-Y",
  altInput: true
});
