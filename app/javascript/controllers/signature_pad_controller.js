import { Controller } from '@hotwired/stimulus';
import SignaturePad from 'signature_pad';

// Connects to data-controller="signature_pad"
export default class extends Controller {
  static targets = ['canvas', 'input'];

  connect() {
    console.log('Hello, Signature_pad.');
    this.canvasTargets.forEach((canvas, index) => {
      this.initializeSignaturePad(canvas, index);
    });
  }

  initializeSignaturePad(canvas, index) {
    const signaturePad = new SignaturePad(canvas, {
      backgroundColor: 'rgb(255, 255, 255)',
      penColor: 'rgb(0, 0, 0)',
    });

    // const saveButton = document.getElementById('save');
    // const cancelButton = document.getElementById('clear');
    // saveButton.addEventListener('click', function (e) {
    //   const data = signaturePad.toDataURL('image/png');
    //   window.open(data);
    // });
    // cancelButton.addEventListener('click', function (e) {
    //   signaturePad.clear();
    // });
  }
}
