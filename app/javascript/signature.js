console.log('Hello! javascript.');

document.querySelectorAll('.signature-pad').forEach((canvas) => {
  const signaturePad = new SignaturePad(canvas, {
    backgroundColor: 'rgb(255, 255, 255)',
    penColor: 'rgb(0, 0, 0)',
  });
});
