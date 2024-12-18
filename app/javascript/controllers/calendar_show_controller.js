import { Controller } from "@hotwired/stimulus";
import flatpickr from 'flatpickr';

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["eventDate"]
  static values = {
    dates: Array,
  }

  connect() {
    console.log(this.eventDateTargets);
    console.log("coucou")

    flatpickr(this.element, {
      inline: true,
      defaultDate: this.datesValue,
      onChange: (event) => {
        document.querySelectorAll(".flatpickr-day.selected").forEach((dayElem) => {
          const dayDate = dayElem.dateObj.toISOString().split("T")[0];
          dayElem.setAttribute("data-calendar-show-target", this.datesValue);
          dayElem.innerHTML = `<span>${dayElem.innerHTML}</span>`;
          this.setEventListener(dayElem)
        });
      },
    });
  }

  setEventListener(dayElem) {
    dayElem.addEventListener("click", (event) => {
     const clickedDates = dayElem.ariaLabel.split(',')[0]
      this.eventDateTargets.forEach(targetedDate => {
        if (targetedDate.innerText.split(',')[0].trim() == clickedDates ) {
          console.log("quelle histoire");
          targetedDate.classList.remove('d-none')
        } else {
          targetedDate.classList.add('d-none')
        }
      })
    })
  }

  compare(event) {
    console.log("coucou")
    console.log(event.currentTarget)
  }
}
