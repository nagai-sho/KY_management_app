import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="hamburger"
export default class extends Controller {
  connect() {
    // ページロード時にメニューの状態を復元
    console.log('hamburger.js');
    this.initializeHamburgerMenu();
  }

  // ハンバーガーメニューの機能を初期化する関数
  initializeHamburgerMenu() {
    const hamburger = document.getElementById('js-hamburger');
    const focusTrap = document.getElementById('js-focus-trap');
    const menu = document.querySelector('.js-nav-area');
    const CLASS = '-active';
    let flg = false;

    // メニュー開閉制御
    hamburger.addEventListener('click', (e) => {
      //ハンバーガーボタンが選択されたら, クラスの有無により要素を追加したり削除する
      e.currentTarget.classList.toggle(CLASS);
      menu.classList.toggle(CLASS);
      if (flg) {
        // flgの状態がtrueの場合
        this.backgroundFix(false); // 背景のスクロールを有効にする
        hamburger.setAttribute('aria-expanded', 'false');
        hamburger.focus();
        flg = false;
      } else {
        // flgの状態がfalseの場合
        this.backgroundFix(true); // 背景のスクロールを無効に（固定）する
        hamburger.setAttribute('aria-expanded', 'true');
        flg = true;
      }
    });

    // window.addEventListener('keydown', ...): ページ全体でキーが押されるのを監視
    window.addEventListener('keydown', () => {
      //escキー押下でメニューを閉じられるように
      if (event.key === 'Escape') {
        hamburger.classList.remove(CLASS); // ハンバーガーアイコンから特定のクラスを削除
        menu.classList.remove(CLASS); // メニュー要素から特定のクラスを削除

        this.backgroundFix(false);
        hamburger.focus();
        hamburger.setAttribute('aria-expanded', 'false');
        flg = false;
        // 背景のスクロールを有効にする
      }
    });

    // フォーカストラップ制御
    // キーボード操作のユーザーがモーダルやメニュー内に「閉じ込められる」ことを防ぐ。
    focusTrap.addEventListener('focus', (e) => {
      hamburger.focus();
    });
  }

  // メニュー展開時に背景を固定
  backgroundFix(bool) {
    // ブラウザによってスクロール可能な要素が異なる場合がある
    const scrollingElement = () => {
      const browser = window.navigator.userAgent.toLowerCase();
      if ('scrollingElement' in document) return document.scrollingElement;
      return document.documentElement;
    };
    // JavaScriptでスクロール位置の取得や設定を行う際に、正しい要素を参照する処理

    const scrollY = bool
      ? scrollingElement().scrollTop
      : parseInt(document.body.style.top || '0');
    // boolがtrueの場合: scrollingElement().scrollTopを使用
    // boolがfalseの場合: document.body.style.topの値を使用
    // スクロール位置を取得し、後で元の位置に戻すために使用

    const fixedStyles = {
      height: '100vh',
      position: 'fixed',
      top: `${scrollY * -1}px`,
      left: '0',
      width: '100vw',
    };
    // 固定スタイルの定義

    Object.keys(fixedStyles).forEach((key) => {
      // Object.keys(fixedStyles)でfixedStylesオブジェクトのすべてのプロパティ名（キー）を配列として取得
      document.body.style[key] = bool ? fixedStyles[key] : '';
      // 取得したキーに対してforEachループを実行し、各スタイルプロパティを処理
    });
    // モーダルやオーバーレイの表示/非表示の制御

    if (!bool) {
      window.scrollTo(0, scrollY * -1);
      // 第一引数の0: 水平方向のスクロール位置（左端）を指定
      // 第二引数のscrollY * -1: 垂直方向のスクロール位置を指定
    }
    // モーダルやオーバーレイを閉じる際（boolがfalseの時）に実行される処理
    // モーダルやオーバーレイを閉じた後、ページを元のスクロール位置に戻す
  }
}
