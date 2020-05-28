import { Controller } from "stimulus";
import { initMapbox } from '../plugins/init_mapbox';


export default class extends Controller {
  static targets = ['map'];
  onPostSuccess(event) {
    console.log(event);
    this.mapTarget.outerHTML = event.detail[2].response;
    initMapbox();
  }
}

