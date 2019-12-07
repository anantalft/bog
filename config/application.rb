require_relative 'boot'
#https://stackoverflow.com/questions/821251/how-to-configure-ruby-on-rails-with-no-database
 require 'rails/all'
# #
# require "active_model/railtie"
# # And now the rest
# require "action_controller/railtie"
# require "action_mailer/railtie"
# require "action_view/railtie"
# require "action_cable/engine" # Only for Rails >= 5.0
# require "active_storage/engine" # Only for Rails >= 5.2
# require "sprockets/railtie"
# require "rails/test_unit/railtie"


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bog
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    #
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
  end
end
