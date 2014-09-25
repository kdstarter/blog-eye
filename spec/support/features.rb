
RSpec.configure do |config|
  config.include Features::ApplicationHelpers, type: :feature
  config.include Features::BlogAdminHelpers, type: :feature
  config.include Features::UserSessionHelpers, type: :feature
end
