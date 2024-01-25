import NestedForm from "stimulus-rails-nested-form"


export default class extends NestedForm {
  connect() {
    this.count = 2;
  }

  add(event) {
    event.preventDefault();

    let content = this.templateTarget.innerHTML.replace(/NEW_ID/g, this.count.toString());
    content = content.replace(/NEW_RECORD/g, new Date().getTime().toString());

    this.count++;
    this.targetTarget.insertAdjacentHTML('beforebegin', content);
  }

  remove(event) {
    this.count--;
    super.remove(event)
  }
}
