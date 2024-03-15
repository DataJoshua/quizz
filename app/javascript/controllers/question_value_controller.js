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
    
    this.inputTargets.forEach(val => {
      if(val.value == this.prevValue) {
        val.value = this.currentValue 
      }
    })
  }

  add() {
    this.inputTargets
        .forEach(val => val.value = val.value || this.currentValue) 
  }
}
