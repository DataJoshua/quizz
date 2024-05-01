# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "stimulus-rails-nested-form" # @4.1.0
pin "tailwindcss-stimulus-components" # @4.0.4
pin "flatpickr" # @4.6.13
pin "stimulus-flatpickr" # @3.0.0
pin "@rails/actioncable", to: "actioncable.esm.js"
pin_all_from "app/javascript/channels", under: "channels"
pin "@rails/request.js", to: "@rails--request.js.js" # @0.0.9
