import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="form-toggle"
export default class extends Controller {
  static targets = ["jackpotField", "itemsField", "amountField", "listField"];

  connect() {
    console.log("FormToggle controller connected");
  }

  toggle(event) {
    const option = event.target.value;

    // Affiche le champ pour la cagnotte
    if (option === "jackpot") {
      this.jackpotFieldTarget.style.display = "block";
      this.itemsFieldTarget.style.display = "none";
    }
    // Affiche le champ pour la liste d'items
    else if (option === "items") {
      this.jackpotFieldTarget.style.display = "none";
      this.itemsFieldTarget.style.display = "block";
    }
  }
}
