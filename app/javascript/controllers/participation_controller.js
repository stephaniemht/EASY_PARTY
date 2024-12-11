import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["checkbox", "amountField"]; 

  connect() {

    this.toggleAmountField();
  }

  toggleAmountField() {

    if (this.checkboxTarget.checked) {
      this.amountFieldTarget.style.display = "block";
    } else {
      this.amountFieldTarget.style.display = "none";
    }
  }

  change(event) {
    this.toggleAmountField();
  }
}
