class ExerciseForm
  include Virtus.model
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attribute :name, String
  attribute :description, String, default: ''
  attribute :audio, String, default: :generate_audio_file_name
  attribute :double_sided, Boolean, default: false

  validates :name, presence: true

  def generate_audio_file_name
    "audio/#{SecureRandom.hex}.wav"
  end
end
