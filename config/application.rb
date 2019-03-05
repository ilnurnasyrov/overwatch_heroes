require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
# require "active_storage/engine"
require "action_controller/railtie"
# require "action_mailer/railtie"
# require "action_view/railtie"
# require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OverwatchHeroes
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    config.paths["app"] = "ui"
    config.paths["app/controllers"] = "ui/controllers"
    config.paths["app/models"] = "data/ar"
    config.paths["db"] = "data/db"
    config.paths["db/migrate"] = "data/db/migrate"
    config.paths["db/seeds.rb"] = "data/db/seeds.rb"

    [
      "ui",
      "ui/controllers",
      "ui/serializers",

      "app",
      "app/utils",
      "app/entities",

      "data",
      "data/ar",

      "lib",
    ].each do |dir|
      config.autoload_paths   << "#{config.root}/#{dir}"
      config.eager_load_paths << "#{config.root}/#{dir}"
    end
  end
end
