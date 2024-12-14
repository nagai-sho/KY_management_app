import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="search-reload"
export default class extends Controller {
  connect() {
    console.log('search_reload.js');
    const url = new URL(window.location.href);
    const params = url.searchParams;
    params.delete('search');
    history.replaceState({}, document.title, url.pathname);
    // this.searchClear();
  }

  // searchClear() {
  //   window.onload = function () {
  //     // 現在のURLを取得
  //     const url = new URL(window.location.href);
  //     // URLSearchParamsオブジェクトを取得
  //     const params = url.searchParams;
  //     // 'search'パラメータを削除
  //     params.delete('search');
  //     // アドレスバーのURLからGETパラメータを削除
  //     history.replaceState({}, document.title, url.pathname);
  //   };
  // }
}
