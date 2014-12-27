
RSpec.configure do |config|
  config.include Features::ApplicationHelpers
  config.include Features::BlogAdminHelpers
  config.include Features::UserSessionHelpers
end
