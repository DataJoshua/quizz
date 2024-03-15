import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "main"]

  connect() {
    this.prevValue = 1
    this.currentValue = 1
    this.inputTargets.forEach(val => val.value = this.currentValue)
  }

  handleMainAction(e) {
    this.prevValue = this.currentValue

    this.currentValue = e.target.value
    this.#changeValue(this.currentValue)
  }

  #changeValue(inputValue) {
    this.inputTargets.forEach(val => {
      if(this.prevValue == val.value) {
        val.value = inputValue 
      }
    })
  }
}
