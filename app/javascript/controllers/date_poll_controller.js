import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["dates"];

  addDate(event) {
    event.preventDefault();

    const newDateField = document.createElement("div");
    newDateField.classList.add("date-field");
    newDateField.innerHTML = `
      <input type="date" name="event[event_dates][][proposed_date]" class="form-control" />
      <button type="button" class="btn btn-danger" data-action="click->date-poll#removeDate">Supprimer</button>
    `;

    this.datesTarget.appendChild(newDateField);
  }

  removeDate(event) {
    event.preventDefault();

    event.target.closest(".date-field").remove();
  }
}
