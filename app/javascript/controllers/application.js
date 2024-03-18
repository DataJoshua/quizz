import { Application } from "@hotwired/stimulus"
import { Modal } from "tailwindcss-stimulus-components"
import Flatpickr from "stimulus-flatpickr"

const application = Application.start()

application.register("flatpickr", Flatpickr)
application.register("modal", Modal)

application.debug = false
window.Stimulus   = application

export { application }
