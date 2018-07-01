require_relative 'boot'
require 'rails/all'
require_relative 'rails_env'
Bundler.require(*Rails.groups)

module Statusapp
  class Application < Rails::Application

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*',
        headers: :any,
        methods: %i(get post put patch delete options head)
      end
    end

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Brasilia'
    config.active_record.default_timezone = :utc

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = 'pt-BR'
    config.i18n.load_path += Dir[File.join(Rails.root,'config','locales','**','*.{rb,yml}')]

    # Configuring AR lock to lock_optimistically
    # Ref: http://blog.cloud66.com/getting-the-most-out-of-your-database-with-ruby-on-rails/
    config.active_record.lock_optimistically = true

    # Autoload stuffs...
    config.autoload_paths << Rails.root.join('lib')

    # sidekiq!
    config.active_job.queue_adapter = :sidekiq

    config.before_configuration do
      Rails.application.credentials.env = RailsEnv.new
    end

  end
end
