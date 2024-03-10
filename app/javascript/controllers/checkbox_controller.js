import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["checkbox"]

  handleSingleAnswer(e) {
    this.checkboxTargets
                        .filter(val => val !== e.target)
                        .forEach(val => { val.checked = false })
  }
}
