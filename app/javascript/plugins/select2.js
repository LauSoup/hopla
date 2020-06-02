import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2({
  placeholder: 'Filtrer par catégorie'
  });
};



export { initSelect2 };
