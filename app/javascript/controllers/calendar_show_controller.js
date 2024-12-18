import { Controller } from "@hotwired/stimulus";
import flatpickr from 'flatpickr';

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["eventDate"]
  static values = {
    dates: Array,
  }

  connect() {
    flatpickr(this.element, {
      inline: true,
      defaultDate: this.datesValue,
      mode: "multiple",
      onReady: () => {
        this.updateDateStyles();
      },
      onChange: () => {
        this.updateDateStyles();
      },
    });
  }


  updateDateStyles() {
    const allDates = document.querySelectorAll(".flatpickr-day");

    const formattedDatesValue = this.datesValue.map((date) => {
      const dateObject = new Date(date.split("T")[0]);
      const options = { month: 'long', day: '2-digit' };
      const formattedDate = new Intl.DateTimeFormat('en-EN', options).format(dateObject);
      return formattedDate;
    });


    allDates.forEach((dayElem) => {
      const dayDate = dayElem.ariaLabel.split(",")[0];
      if (formattedDatesValue.includes(dayDate)) {
        dayElem.classList.add("custom-selected");
      } else {
        dayElem.classList.remove("custom-selected");
      }
      this.setEventListener(dayElem);
    });
  }

  setEventListener(dayElem) {
    dayElem.addEventListener("click", (event) => {
      const clickedDate = dayElem.ariaLabel.split(',')[0];

      this.eventDateTargets.forEach(targetedDate => {
        if (targetedDate.innerText.split(',')[0].trim() === clickedDate) {
          targetedDate.classList.remove('d-none');
        } else {
          targetedDate.classList.add('d-none');
        }
      });
    });
  }
}
