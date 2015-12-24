class ExerciseForm
  include Virtus.model
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attribute :name, String
  attribute :description, String, default: ''
  attribute :audio, String

  validates :name, presence: true
end
