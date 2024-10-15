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

      const form = canvas.closest('form');
      const signatureDataInput = form.querySelector(
        `#${canvas.id.replace('signature-pad', 'signature_sig')}`
      );

      this.addFormSubmitListener(form, signatureDataInput, signaturePad);
    });
  }

  addFormSubmitListener(form, signatureDataInput, signaturePad) {
    form.addEventListener('submit', (e) => {
      const dataURL = signaturePad.toDataURL();
      const base64data = dataURL.split(',')[1];
      signatureDataInput.value = base64data;
    });
  }
}
