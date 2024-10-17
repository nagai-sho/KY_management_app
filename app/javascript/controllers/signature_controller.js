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
    // 11箇所の.signature-padセレクタにsignature_padを適用
    const canvases = document.querySelectorAll('.signature-pad');
    canvases.forEach((canvas) => {
      const signaturePad = new SignaturePad(canvas, {
        backgroundColor: 'rgb(255, 255, 255)',
        penColor: 'rgb(0, 0, 0)',
      });
      this.signaturePads[canvas.id] = signaturePad;
    });

    const form = document.getElementById('form');
    form.addEventListener('submit', (e) => {
      e.preventDefault();
      canvases.forEach((canvas) => {
        this.insertHiddenValue(canvas);
      });
      this.submit(form);
    });
  }

  insertHiddenValue(canvas) {
    const signaturePad = this.signaturePads[canvas.id];
    const dataURL = signaturePad.toDataURL();
    const signatureDataInput = document.getElementById(
      `signature_${canvas.id}`
    );
    signatureDataInput.value = dataURL;
  }

  submit(form) {
    form.target = '_blank';
    form.submit();
  }
}

// form.target = '_blank';　で別タブが開く
// form.submit();　formを送信する

// 複数箇所にあるsignature-padのうち、一個目のcanvasだけ送信される
// form.target = '_blank';　のタイミングが問題？
// form.submit();　で繰り返し送信する意味は？

// canvasに記入
// submitが押される
// イベント発火
// e.preventDefault(); で通常のフォームがキャンセルされる
// const dataURL = signaturePad.toDataURL(); 文字列（URL）の生成、Base64エンコード処理
// const signatureDataInput = document.getElementById(`signature_${canvas.id}`); hidden要素に格納
// signatureDataInput.value = dataURL; input要素（今回はhidden要素）のvalue属性にdataURLを追加
