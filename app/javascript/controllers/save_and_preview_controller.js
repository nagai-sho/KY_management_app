import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="save-and-preview"
export default class extends Controller {
  connect() {
    console.log('Hello! save and preview.');
    this.preview();
  }

  preview() {
    document.addEventListener('signatureComplete', (e) => {
      debugger;
      const signatureData = e.detail.signatureData;
      const form = document.getElementById('form');
      const formData = new FormData(form);

      const projectId = this.element.dataset.projectId;

      fetch(`/projects/${projectId}/ky_sheets/preview_pdf`, {
        method: 'POST',
        body: formData,
        headers: {
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]')
            .content,
          Accept: 'application/pdf',
        },
      })
        .then((response) => response.blob())
        .then((blob) => {
          const url = window.URL.createObjectURL(blob);
          window.open(data.pdf_url, '_blank');
          // .then((data) => {
          //   if (data.pdf_url) {
          //   }
        });
    });
  }
}
