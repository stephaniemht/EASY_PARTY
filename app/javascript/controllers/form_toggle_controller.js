import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="form-toggle"
export default class extends Controller {
  static targets = ["choiceField", "amountField", "listField"];

  connect() {
    console.log("FormToggle controller connected");
    console.log(this.choiceFieldTarget);

  }

  toggle() {
    console.log(this.choiceFieldTargets[0].checked);
    console.log(this.choiceFieldTargets[1].checked);

    if (this.choiceFieldTargets[0].checked) {
      this.amountFieldTarget.classList.remove('d-none')
      this.listFieldTarget.classList.add('d-none')
    } else if (this.choiceFieldTargets[1].checked) {
      this.listFieldTarget.classList.remove('d-none')
      this.amountFieldTarget.classList.add('d-none')
    }
  }
}


  //   // Affiche le champ pour la cagnotte
  //   if (option === "jackpot") {
  //     this.jackpotFieldTarget.style.display = "block";
  //     this.itemsFieldTarget.style.display = "none";
  //   }
  //   // Affiche le champ pour la liste d'items
  //   else if (option === "items") {
  //     this.jackpotFieldTarget.style.display = "none";
  //     this.itemsFieldTarget.style.display = "block";
  //   }
