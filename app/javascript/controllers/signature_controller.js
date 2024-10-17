import { Controller } from '@hotwired/stimulus';
import SignaturePad from 'signature_pad';

// Connects to data-controller="signature"
export default class extends Controller {
  static targets = ['canvas'];

  connect() {
    console.log('Hello! signature.');
    this.signaturePads = {};
    this.initializeSignaturePads();
  }

  initializeSignaturePads() {
    document.querySelectorAll('.signature-pad').forEach((canvas) => {
      const signaturePad = new SignaturePad(canvas, {
        backgroundColor: 'rgb(255, 255, 255)',
        penColor: 'rgb(0, 0, 0)',
      });
      this.signaturePads[canvas.id] = signaturePad;
      this.setupFormSubmitListener(canvas, signaturePad);
    });
  }

  setupFormSubmitListener(canvas, signaturePad) {
    debugger;
    const form = canvas.closest('form');
    form.addEventListener('submit', (e) => {
      e.preventDefault();
      const dataURL = signaturePad.toDataURL();
      const signatureDataInput = document.getElementById(
        `signature_${canvas.id}`
      );
      signatureDataInput.value = dataURL;
      form.target = '_blank';
      form.submit();
    });
  }
}
