// app/javascript/controllers/hotkey_controller.js

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input"]

  handleKeydown(event) {
    if (event.key === "Enter") {
      event.preventDefault()
      this.submitForm()
    } else if (event.key === "Escape") {
      event.preventDefault()
      this.cancelAction()
    }
  }

  connect() {
    // Set focus to the input field when the controller connects
    this.inputTarget.focus()
  }

  submitForm() {
    this.element.requestSubmit()
  }

  cancelAction() {
    // Submit the cancel action via a POST request
    fetch(this.cancelUrlValue, {
      method: 'POST',
      headers: {
        'X-CSRF-Token': this.csrfToken,
        'Accept': 'text/vnd.turbo-stream.html',
      },
    })
      .then(response => response.text())
      .then(turboStream => {
        Turbo.renderStreamMessage(turboStream)
      })
      .catch(error => {
        console.error('Error processing Turbo Stream:', error)
      })
  }

  get csrfToken() {
    return document.querySelector('meta[name="csrf-token"]').content
  }

  static values = {
    cancelUrl: String,
  }
}