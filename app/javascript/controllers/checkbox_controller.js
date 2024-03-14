import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["checkbox"]
  static values = {
    correctOptions : Number
  }

  execute(e) {
    if(this.correctOptionsValue === 1) {
      this.#handleSingleAnswer(e)
    }
  }

  #handleSingleAnswer(e) {
    this.checkboxTargets
                        .filter(val => val !== e.target)
                        .forEach(val => { val.checked = false })
  }
}
