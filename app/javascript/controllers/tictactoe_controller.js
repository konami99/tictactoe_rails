import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {

  }

  click(e) {
    const csrfToken = document.querySelector("[name='csrf-token']").content;
    fetch(`/tictactoeboards/click`, {
      method: 'POST',
      mode: 'cors',
      cache: 'no-cache',
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrfToken,
      },
      body: JSON.stringify({ cell: e.target.id }) 
    })
    .then (response => response.text())
    .then(html => Turbo.renderStreamMessage(html));
  }

  reset(e) {
    if(confirm('Are you sure?')) {
      const csrfToken = document.querySelector("[name='csrf-token']").content;
      fetch(`/tictactoeboards/reset`, {
        method: 'POST',
        mode: 'cors',
        cache: 'no-cache',
        credentials: 'same-origin',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': csrfToken,
        }
      })
      .then (response => response.text())
      .then(html => Turbo.renderStreamMessage(html));
    }
  }

  leave(e) {
    if(confirm('Are you sure?')) {
      const csrfToken = document.querySelector("[name='csrf-token']").content;
      fetch(`/tictactoeboards/leave`, {
        method: 'POST',
        mode: 'cors',
        cache: 'no-cache',
        credentials: 'same-origin',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': csrfToken,
        }
      })
      .then (response => response.text())
      .then(html => Turbo.renderStreamMessage(html));
    }
  }

  join(e) {
    let modal = document.getElementById("my-modal");
    modal.style.display = "block";
  }
}