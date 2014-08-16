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
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}"
  end

  def filename
    if original_filename.present?
      file_suffix = model.avatar.file.path.split('.').last.downcase
      file_suffix = 'jpg' if file_suffix == 'jpeg'
      "#{model.id}_#{model.email_md5}.#{file_suffix}"
    end
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Create different versions of your uploaded files:
  version :large do
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

end
