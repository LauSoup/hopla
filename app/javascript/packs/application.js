// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("effects/typed_effect")
//= require rails-ujs
//= require ./cable.js

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

//= require jquery
//= require jquery_ujs

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { flatpickMethod } from "../plugins/flatpickr";
import { initMapbox } from '../plugins/init_mapbox';
// import { dropdownForm } from "../effects/dropdown_form";
import { formActive } from "../components/category_choices";
import { typedMethod } from "../effects/typed_effect";
import { scrollNewResearch } from "../effects/scroll_new_research";
import { initAutocomplete } from "../plugins/init_autocomplete";
import { multipleFormShop } from "../effects/multiple_forms";
import { multipleFormEvent } from "../effects/multiple_forms";

import { scrollAnime } from "../effects/scrolled_appear";
// import { rippleButtons } from '../effects/ripple_buttons';
// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { initSelect2 } from '../plugins/select2';


document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initMapbox();
  flatpickMethod();
  formActive();
  typedMethod();
  // rippleButtons();
  scrollNewResearch();
  initAutocomplete();
  multipleFormShop();
  multipleFormEvent();
  scrollAnime();
  initSelect2();

  // dropdownForm();
});

import "controllers"
