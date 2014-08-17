# encoding: utf-8
class UserAvatarUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file

  def url(param={})
    "http://#{Settings.cdn.bucket_domain}/#{self.path}" unless self.blank?
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "#{Settings.cdn.dir_prefix}/users/#{model.id}"
  end

  def filename
    if original_filename.present?
      file_prefix = model.avatar.file.path.split('.').last.downcase
      "#{mounted_as}_#{secure_token}.#{file_prefix}"
    end
  end

  # def move_to_cache
  #   false
  # end

  # def move_to_store
  #   false
  # end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Create different versions of your uploaded files:
  version :content do
    # Process files as they are uploaded:
    # process :quality => 80
    process :resize_to_fit => [500, 500]
  end

  process :resize_to_fill => [120, 120]

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg png)
  end

  protected
  def secure_token(length=16)
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.hex(length/2))
  end

end
