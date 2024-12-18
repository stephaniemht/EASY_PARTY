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
      // 02 10 21
      // 2
      const formattedDate = new Intl.DateTimeFormat('en-EN', options).format(dateObject);
      return formattedDate;
    });


    allDates.forEach((dayElem, event) => {
      const dayDate = dayElem.ariaLabel.split(",")[0];
      const [month, day] = dayDate.split(' ');
      const formattedDay = day.length === 1 ? '0' + day : day;
      const formattedDate = `${month} ${formattedDay}`;

      if (formattedDatesValue.includes(formattedDate)) {
        dayElem.classList.add("custom-non-selected");
      } else {
        dayElem.classList.remove("custom-selected");
      }
      this.setEventListener(dayElem);
    });
  }

  setEventListener(dayElem) {
    dayElem.addEventListener("click", (event) => {
      const clickedDate = dayElem.ariaLabel.split(',')[0];
      const [clickedMonth, clickedDay] = clickedDate.split(' ');

      const formattedClickedDay = clickedDay.length === 1 ? '0' + clickedDay : clickedDay;
      const formattedClickedDate = `${clickedMonth} ${formattedClickedDay}`;

      this.eventDateTargets.forEach(targetedDate => {

        const targetedDateText = targetedDate.innerText.split(',')[0].trim();
        const [targetedMonth, targetedDay] = targetedDateText.split(' ');

        const formattedTargetedDay = targetedDay.length === 1 ? '0' + targetedDay : targetedDay;
        const formattedTargetedDate = `${targetedMonth} ${formattedTargetedDay}`;

        if (formattedTargetedDate === formattedClickedDate) {
          targetedDate.classList.remove('d-none');
        } else {
          targetedDate.classList.add('d-none');
        }
      });
    });
  }

}
