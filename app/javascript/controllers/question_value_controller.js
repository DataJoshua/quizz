import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "main"]

  connect() {
    this.currentValue = 1
    this.inputTargets.forEach(val => val.value = this.currentValue)
  }

  handleMainAction(e) {
    this.currentValue = e.target.value
    this.#changeValue(() => this.currentValue)
  }

  handleAddAction(_e) {
    this.#changeValue(val => val.value || this.currentValue)
  }

  #changeValue(inputValue) {
    this.inputTargets.forEach(val => val.value = inputValue(val))
  }
}
