class TrainingForm
  include Virtus.model
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attribute :name, String
  attribute :exercises_ids, Array[Integer]
  attribute :exercises_duration, Array[Integer]
  attribute :exercises_series_number, Array[Integer]

  validates :name, presence: true
end
