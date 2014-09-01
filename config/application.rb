require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BlogEye
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Beijing'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :'zh-CN'
    config.i18n.available_locales = [:'zh-CN', :en]

    config.autoload_paths += %W(#{config.root}/app/models/ckeditor)

    SimpleCaptcha.store = Settings.cache_store.name
    config.cache_store = Settings.cache_store.store, Settings.cache_store.store_dir, { expires_in: Settings.cache_store.expires_in.to_f.minutes }

    Settings.add_source!("#{Rails.root}/config/sensitive.yml")
    Settings.reload!

    config.to_prepare do
      devise_layout = 'admin/session'
      Devise::SessionsController.layout devise_layout
      Devise::RegistrationsController.layout devise_layout
      Devise::ConfirmationsController.layout devise_layout
      Devise::UnlocksController.layout devise_layout
      Devise::PasswordsController.layout devise_layout
    end
  end
end
