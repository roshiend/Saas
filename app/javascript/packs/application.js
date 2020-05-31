
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import 'bootstrap';

import '../stylesheets/application';
import "@fortawesome/fontawesome-free/js/all";
import "packs/adminlte.min";
import "packs/OverlayScrollbars.min";
import "packs/dashboard2";


global.toastr = require("toastr")