import { flatpickr } from 'flatpickr';
import { Japanese } from 'flatpickr/dist/l10n/ja';

export function initFlatpickr() {
  flatpickr('.datepicker', {
    locale: Japanese,
    dateFormat: 'Y-m-d',
    allowInput: true,
  });
}
