# encoding: utf-8
class UserAvatarUploader < CommonUploader
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

  # def cache_path
  #   "#{Settings.cache_store.store_dir}/#{self.path}" unless self.blank?
  # end

  def filename
    "#{secure_token}.#{model.avatar.file.path.split('.').last.downcase}" if original_filename
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    # For Rails 3.1+ asset pipeline compatibility:
    ActionController::Base.helpers.asset_path("shared/user_avatar/" + [version_name, "default.jpg"].compact.join('_')).sub('/assets/', '')
  end

  process :resize_to_fill => [460, 460]

  # Create different versions of your uploaded files:
  version :thumb do
    # Process files as they are uploaded:
    # process :quality => 80
    process :resize_to_fit => [96, 96]
  end

  version :content do
    # Process files as they are uploaded:
    # process :quality => 80
    process :resize_to_fit => [800, 800]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    # %w(jpg jpeg png)
    Ckeditor.image_file_types
  end
end
