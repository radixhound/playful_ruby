// all I need to do is add hotkeys to each of the game tiles around the player
// then map the hotkey to the 'move to me' action?
// this could make it easy to handle the presence of obstacles, just by
// not rendering a 'move to me' option there?

// I wonder how fast roundtrips to the server can be?
// I wonder how much we care about it being slow or not?
import { Controller } from '@hotwired/stimulus'
import { install } from '@github/hotkey'

// Install all the hotkeys on the page
export default class extends Controller {
  connect() {
    for (const el of document.querySelectorAll('[data-hotkey]')) {
      install(el)
    }
  }
}
