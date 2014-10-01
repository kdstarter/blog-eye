
# Sidekiq SERVER configuration
Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:6379/12', namespace: "sidekiq_#{Rails.env}" }
end

# Sidekiq CLIENT configuration
Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6379/12', namespace: "sidekiq_#{Rails.env}", size: 1 }
end
