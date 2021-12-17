
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

var jQuery = require("jquery")
global.$ = global.jQuery = jQuery
window.$ = window.jQuery = jQuery

Rails.start()
Turbolinks.start()
ActiveStorage.start()
import('../material-dashboard.js')
