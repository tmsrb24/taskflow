import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"
import { patch } from '@rails/request.js'

// Connects to data-controller="drag"
export default class extends Controller {
  connect() {
    this.sortable = Sortable.create(this.element, {
      onEnd: this.onEnd.bind(this),
      animation: 150,
    })
  }

  onEnd(event) {
    const { newIndex, item } = event
    const id = item.dataset.id
    const url = item.dataset.url

    patch(url, {
      body: JSON.stringify({ position: newIndex + 1 })
    })
  }
}
