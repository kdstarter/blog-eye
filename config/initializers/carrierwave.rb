
if Rails.env.production? || Rails.env.development?
  CarrierWave.configure do |config|
    config.storage             = Settings.cdn.storage.to_sym
    config.qiniu_access_key    = Settings.cdn.access_key
    config.qiniu_secret_key    = Settings.cdn.secret_key

    config.qiniu_bucket        = Settings.cdn.bucket
    config.qiniu_bucket_domain = Settings.cdn.bucket_domain
  end
elsif Rails.env.test? || Rails.env.rspec?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
else
  Rails.logger.error 'Carrierwave storage settings not initialized.'
end
