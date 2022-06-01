import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  updateNavbar() {
    if (window.scrollY >= 50) {
      this.element.classList.add("navbar-white")

    } else {
      this.element.classList.remove("navbar-white")
    }
  };
}
