import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "refresh" ]

  refresh() {
    this.refreshTarget.classList.add("opacity-50")
  }
}
