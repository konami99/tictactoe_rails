// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import Toastify from "toastify-js"

window.Turbo.StreamActions.reload = function() {
  location.reload(true);
}

window.Turbo.StreamActions.toast = function() {
  const message = this.getAttribute("message")
  Toastify({
    text: message,
    duration: 3000,
    destination: "",
    close: true,
    gravity: "top",
    position: 'center',
    stopOnFocus: true,
    style: {
      background: "linear-gradient(to right, #00b09b, #96c93d)",
    }
  }).showToast()
}
