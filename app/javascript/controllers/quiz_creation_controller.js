import { Controller } from "@hotwired/stimulus"
import consumer from "channels/consumer"
import { post } from "@rails/request.js" 

export default class extends Controller {
  static values = {
    path: String
  }

  connect() {
    const path = this.pathValue

    consumer.subscriptions.create("QuizChannel", {
      received(data) {
        if(data.action === "create") {
          console.log(data);
          post(path, { responseKind: "turbo-stream", body: { msg: data.msg, quiz_id: data.quiz } })
        }
      },
    })
  }
}
