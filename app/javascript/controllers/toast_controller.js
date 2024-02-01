import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["body"]

  dismiss(){
    this.bodyTarget.style.display = "none";
  }
}
