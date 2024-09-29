import flatpickr from 'flatpickr';
import { Japanese } from 'flatpickr/dist/l10n/ja';

export function initFlatpickr() {
  flatpickr('.datepicker', {
    locale: Japanese,
    dateFormat: 'Y-m-d',
    allowInput: true,
  });
}

// function initializeFlatpickr() {
//   flatpickr('.datepicker', {
//     locale: Japanese,
//     dateFormat: 'Y-m-d',
//     allowInput: true,
//   });
// }

// function reinitializeFlatpickr() {
//   console.log('Reinitializing Flatpickr');
//   document.querySelectorAll('.datepicker').forEach((element) => {
//     if (element._flatpickr) {
//       console.log('Destroying existing Flatpickr instance');
//       element._flatpickr.destroy();
//     }
//   });
//   initializeFlatpickr();
// }

// document.addEventListener('DOMContentLoaded', initializeFlatpickr);
// document.addEventListener('turbo:load', reinitializeFlatpickr);
// document.addEventListener('turbo:render', reinitializeFlatpickr);
// document.addEventListener('ajax:success', reinitializeFlatpickr);

// document.addEventListener('turbo:before-render', () => {
//   console.log('turbo:before-render event fired');
// });

// document.addEventListener('turbo:render', () => {
//   console.log('turbo:render event fired');
// });

// // by claude
// // // DOMContentLoadedイベントで初期化
// // document.addEventListener('DOMContentLoaded', initializeFlatpickr);

// // // Turboのloadイベントで初期化
// // document.addEventListener('turbo:load', initializeFlatpickr);

// // // Turboのrenderイベントで初期化 (フォーム送信後のレンダリングに対応)
// // document.addEventListener('turbo:render', initializeFlatpickr);

// // // 既存のflatpickrインスタンスを破棄してから再初期化する関数
// // function reinitializeFlatpickr() {
// //   document.querySelectorAll('.datepicker').forEach(element => {
// //     if (element._flatpickr) {
// //       element._flatpickr.destroy();
// //     }
// //   });
// //   initializeFlatpickr();
// // }

// // // Ajax成功時のイベントで再初期化
// // document.addEventListener('ajax:success', reinitializeFlatpickr);
