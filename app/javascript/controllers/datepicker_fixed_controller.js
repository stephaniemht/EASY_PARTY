import { Controller } from "@hotwired/stimulus"
import  flatpickr  from 'flatpickr';
// Connects to data-controller="datepicker-fixed"
export default class extends Controller {
  connect() {
    console.log("hello from datepicker fixed");

    flatpickr(this.element, {
      inline: true
    })
  }
}
