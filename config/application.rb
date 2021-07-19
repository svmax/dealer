require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
# require 'active_model/railtie'
# require 'active_job/railtie'
# require 'active_record/railtie'
# require 'active_storage/engine'
require 'action_controller/railtie'
# require 'action_mailer/railtie'
# require 'action_mailbox/engine'
# require 'action_text/engine'
# require 'action_view/railtie'
# require 'action_cable/engine'
# require 'sprockets/railtie'
# require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dotenv::Railtie.load

module Dealer
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += %W(#{config.root}/services)
    config.autoload_paths += %W(#{config.root}/interactions)

    config.middleware.insert_before 0, Rack::Cors do
      allow do
         origins '*'
         resource '*', headers: :any, methods: %i[get post options]
       end
    end
  end
end