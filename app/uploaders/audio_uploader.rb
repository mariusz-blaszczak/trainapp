# encoding: utf-8

class AudioUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    'audio'
  end

  def extension_white_list
    %w(wav)
  end

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  private

  def secure_token
    var = :"@audio_secure_token"
    model.instance_variable_get(var) || model.instance_variable_set(var, SecureRandom.uuid)
  end
end
