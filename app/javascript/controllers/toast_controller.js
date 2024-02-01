import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["body"]

  connect() {
    if(this.hasBodyTarget) {
      setTimeout(() => {
      this.bodyTarget.classList.add("dismiss-animation");
      
      }, 5000);
    }
  }

  dismiss(){
    this.bodyTarget.classList.add("dismiss-animation");
  }
}
