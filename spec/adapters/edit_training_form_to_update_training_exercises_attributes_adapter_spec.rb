require 'rails_helper'

describe EditTrainingFormToUpdateTrainingExercisesAttributesAdapter do
  subject { described_class.new(form) }
  let(:form) do
    instance_double 'EditTrainingForm', exercises_ids: [1, 2, 3],
                    exercises_duration: [3, 4, 5],
                    exercises_series_number: [6, 7, 8],
                    training_exercises_ids: [9, nil, '']
  end
  let(:expected_attributes) do
    [
      { exercise_id: 1, duration: 3, series_number: 6, id: 9 },
      { exercise_id: 2, duration: 4, series_number: 7, id: nil },
      { exercise_id: 3, duration: 5, series_number: 8, id: nil }
    ]
  end

  it 'returns an array of parameters' do
    expect(subject.call).to eq(expected_attributes)
  end
end