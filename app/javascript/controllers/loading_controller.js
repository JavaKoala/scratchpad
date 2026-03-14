import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "note" ]

  refresh() {
    this.noteTarget.classList.add("opacity-50")
  }
}
