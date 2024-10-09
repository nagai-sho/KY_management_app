import { Controller } from '@hotwired/stimulus';
export default class extends Controller {
  connect() {
    document.addEventListener('turbo:render', this.reinitializeFlatpickr);
  }

  disconnect() {
    document.removeEventListener('turbo:render', this.reinitializeFlatpickr);
  }

  reinitializeFlatpickr = () => {
    const flatpickrControllers = this.application.controllers.filter(
      (controller) => controller.identifier === 'flatpickr'
    );
    flatpickrControllers.forEach((controller) => {
      if (controller.initializeFlatpickr) {
        controller.initializeFlatpickr();
      }
    });
  };
}
