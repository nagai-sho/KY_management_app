import { Controller } from '@hotwired/stimulus';
import { initFlatpickr } from '../flatpickr_config';

// Connects to data-controller="flatpickr"
export default class extends Controller {
  connect() {
    this.initializeFlatpickr();
  }

  initializeFlatpickr() {
    initFlatpickr();
  }
}
