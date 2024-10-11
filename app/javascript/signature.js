document.addEventListener('DOMContentLoaded', function () {
  console.log('Hello! signature.');

  document.querySelectorAll('.signature-pad').forEach((canvas) => {
    const signaturePad = new SignaturePad(canvas, {
      backgroundColor: 'rgb(255, 255, 255)',
      penColor: 'rgb(0, 0, 0)',
    });

    // signaturePads[canvas.id] = signaturePad;

    // const form = canvas.closest('form');
    // if (!form) {
    //   console.error('フォームが見つかりませんでした。');
    //   return;
    // }
    // const signatureDataInput = form.querySelector();
  });
});
