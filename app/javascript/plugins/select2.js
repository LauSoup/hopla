import $ from 'jquery';
import 'select2';
import 'select2/dist/css/select2.css';

const initSelect2 = () => {
  $('.select2').select2({
  placeholder: 'Filtrez par catégorie',
  width: '100%',
  selectOnClose: true
  });
};

export { initSelect2 };
