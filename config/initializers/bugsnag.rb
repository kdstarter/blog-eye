
Bugsnag.configure do |config|
  config.api_key = Settings.bugsnag.api_key
  config.notify_release_stages = ["production"]
end
