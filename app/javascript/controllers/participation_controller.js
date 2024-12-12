import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["checkbox", "amountField", "listField"];

  connect() {

    this.toggleAmountField();
  }

  toggleAmountField() {

    if (this.checkboxTarget.checked) {
      this.amountFieldTarget.style.display = "block";
      this.listFieldTarget.style.display = "none";
    } else {
      this.amountFieldTarget.style.display = "none";
      this.listFieldTarget.style.display = "block";
    }
  }

  change(event) {
    this.toggleAmountField();
  }
}
