class CommonUploader < CarrierWave::Uploader::Base
  def filename
    if original_filename.present?
      file_prefix = model.data.file.path.split('.').last.downcase
      "#{secure_token}.#{file_prefix}"
    end
  end

  protected
  def secure_token(length=16)
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.hex(length/2))
  end  
end
