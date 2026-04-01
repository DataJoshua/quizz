import { Controller } from "@hotwired/stimulus"
import consumer from "channels/consumer"
import { get } from "@rails/request.js" 

export default class extends Controller {
  static values = {
    path: String
  }

  connect() {
    const path = this.pathValue

    consumer.subscriptions.create("QuizChannel", {
      received(data) {
        get(`${path}?msg=${data.msg}&action=${data.action}`, { responseKind: "turbo-stream" })  
      },
    })
  }
}
