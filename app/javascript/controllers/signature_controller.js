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
      this.clearSignaturePad(canvas);
    });

    const form = document.getElementById('form');
    form.addEventListener('submit', (e) => {
      e.preventDefault();
      canvases.forEach((canvas) => this.insertHiddenValue(canvas));
      form.submit();
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

  save_pdf() {
    const saveForm = document.getElementById('save_form');
    saveForm.addEventListener('click', (e) => {
      const form = document.getElementById('form');
      form.addEventListener('submit', (e) => {
        e.preventDefault();
        canvases.forEach((canvas) => this.insertHiddenValue(canvas));
        this.submit(form);
      });
    });
  }

  addSignatureCompleteEvent() {
    // 別のjsファイルにて送信処理を実行
    const signatureData = Array.from(canvases).map(
      (canvas) => document.getElementById(`signature_${canvas.id}`).value
    );
    const event = new CustomEvent('signatureComplete', {
      detail: { signatureData: signatureData },
    });
    document.dispatchEvent(event);
  }

  clearSignaturePad(canvas) {
    const clearCanvas = document.querySelector(
      `button[data-canvas-id="${canvas.id}"]`
    );
    const signaturePad = this.signaturePads[canvas.id];
    clearCanvas.addEventListener('click', (e) => {
      // e.preventDefault();
      signaturePad.clear();
    });
  }

  // submit(form) {
  //   form.target = '_blank';
  //   form.submit();
  // }
}

// canvasに記入
// submitが押される
// イベント発火
// e.preventDefault(); で通常のフォームがキャンセルされる
// const dataURL = signaturePad.toDataURL(); 文字列（URL）の生成、Base64エンコード処理
// const signatureDataInput = document.getElementById(`signature_${canvas.id}`); hidden要素に格納
// signatureDataInput.value = dataURL; input要素（今回はhidden要素）のvalue属性にdataURLを追加

// form.target = '_blank'; で別タブが開く
// form.submit(); formを送信する
