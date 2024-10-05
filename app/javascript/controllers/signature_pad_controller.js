import SignaturePad from 'signature_pad';

var signaturePad = new SignaturePad(document.getElementById('signature_pad'), {
  backgroundColor: 'rgb(255,255,255)',
  pevColor: 'rgb(0,0,0)',
});
var saveButton = document.getElementById('save');
var cancelButton = document.getElementById('clear');

saveButton.addEventListener('click', function (event) {
  var data = signaturePad.toDataURL('image/png');
  window.open(data);
});

cancelButton.addEventListener('click', function (event) {
  signaturePad.clear();
});

// const canvas = document.getElementById('signature_pad');
// const signaturePad = new SignaturePad(canvas, {
//   backgroundColor: 'rgb(255,255,255)',
//   pevColor: 'rgb(0,0,0)',
// });

// signaturePad.addEventListener(
//   'beginStroke',
//   () => {
//     console.log('Signature started');
//   },
//   { once: true }
// );

// export default class extends Controller {
//   static targets = ['canvas', 'hiddenField'];

//   connect() {
//     this.signaturePad = new SignaturePad(this.canvasTarget);
//   }

//   clear() {
//     this.signaturePad.clear();
//   }

//   save(event) {
//     if (this.signaturePad.isEmpty()) {
//       event.preventDefault();
//       alert('署名してください。');
//     } else {
//       this.hiddenFieldTarget.value = this.signaturePad.toDataURL();
//     }
//   }
// }
