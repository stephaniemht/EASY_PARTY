import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dates"
export default class extends Controller {
  static targets = ["checkboxFixed", "checkboxProposed", "fixedDateField", "proposedDateField", "datesList"];

  connect() {
    this.toggleDateField();
  }

  toggleDateFields() {

    const isFixedChecked = this.checkboxFixedTarget.checked;
    const isProposedChecked = this.checkboxProposedTarget.checked;

    this.fixedDateFieldTarget.style.display = isFixedChecked ? "block" : "none";
    this.proposedDateFieldTarget.style.display = isProposedChecked ? "block" : "none";
  }

  addDateField(event) {
    event.preventDefault();

    // Clone le premier champ de la liste
    const newField = this.proposedDateFieldTarget.cloneNode(true);
    newField.style.display = "block"; // Affiche le nouveau champ
    newField.querySelector("input").value = ""; // Réinitialise l'entrée

    // Ajoute le champ cloné à la liste
    this.datesListTarget.appendChild(newField);
  }

  removeDateField(event) {
    event.preventDefault();

    const field = event.currentTarget.closest(".proposed-date-field");
    if (field) field.remove();
  }

}
