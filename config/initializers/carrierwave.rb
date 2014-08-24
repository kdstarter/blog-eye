
CarrierWave.configure do |config|
  config.permissions = 0777
  config.directory_permissions = 0777

  if Rails.env.production? || Rails.env.development?
    config.storage             = Settings.cdn.storage.to_sym
    config.qiniu_access_key    = Settings.cdn.access_key
    config.qiniu_secret_key    = Settings.cdn.secret_key

    config.qiniu_bucket        = Settings.cdn.bucket
    config.qiniu_bucket_domain = Settings.cdn.bucket_domain
  elsif Rails.env.test? || Rails.env.rspec?
    config.storage = :file
    config.enable_processing = false
  else
    Rails.logger.error 'Carrierwave storage settings not initialized.'
  end
end
