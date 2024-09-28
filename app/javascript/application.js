// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import '@hotwired/turbo-rails';
import 'controllers';

import flatpickr from 'flatpickr';
import { Japanese } from 'flatpickr/dist/l10n/ja';

document.addEventListener('turbo:load', function () {
  flatpickr('.datepicker', {
    locale: Japanese,
    dateFormat: 'Y-m-d',
    allowInput: true,
  });
});
