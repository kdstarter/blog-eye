
require 'rails_helper'
require 'watir-webdriver'
require 'rspec/example_steps'

RSpec.configure do |config|
  config.include Features::ApplicationHelpers
  config.include Features::UserSessionHelpers, type: :feature
  config.include Features::BlogAdminHelpers, type: :feature
end
