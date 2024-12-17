import { Controller } from "@hotwired/stimulus";
import  flatpickr  from 'flatpickr';
// Connects to data-controller="datepicker"
export default class extends Controller {
  static values = {
    date: String
  }
  connect() {
    flatpickr(this.element, {
      inline: true,
      defaultDate: this.dateValue
    })
  }

  
}
