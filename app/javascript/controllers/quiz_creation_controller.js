import { Controller } from "@hotwired/stimulus"
import consumer from "channels/consumer"

export default class extends Controller {
  connect() {
    consumer.subscriptions.create("QuizChannel", {
      received(data) {
        if(data.action === "create") {
          console.log(data.partial);
          location.reload();
        }
      },
    })
  }
}
