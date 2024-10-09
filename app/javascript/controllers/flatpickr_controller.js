import { Controller } from '@hotwired/stimulus';
import { initFlatpickr } from '../flatpickr_config';
export default class extends Controller {
  connect() {
    this.initializeFlatpickr();
  }

  initializeFlatpickr() {
    initFlatpickr();
  }
}
