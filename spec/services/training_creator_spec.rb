require 'rails_helper'

describe TrainingCreator do
  subject { described_class.new(form) }
  let(:exercises_ids) { [1, 2, 3] }
  let(:exercises_duration) { [10, 20, 30] }
  let(:form) do
    double('form', name: 'some training',
                   exercises_ids: exercises_ids,
                   exercises_duration: exercises_duration)
  end

  it 'creates tracing' do
    expect { subject.call }.to change { Training.all.count }.by(+1)
  end

  it 'creates training_exercises' do
    expect { subject.call }.to change { TrainingExercise.all.count }.by(+3)
  end

  it 'creates training_exercises with valid duration' do
    subject.call
    expect(TrainingExercise.all.map(&:duration)).to eq([10, 20, 30])
  end

  it 'creates trainig_exercises with valid exercises_ids' do
    subject.call
    expect(TrainingExercise.all.map(&:exercise_id)).to eq([1, 2, 3])
  end
end
