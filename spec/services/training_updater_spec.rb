require 'rails_helper'

describe TrainingUpdater do
  subject { described_class.new(form, training.id) }
  let(:training) { create(:training, name: 'name1') }
  let(:training_exercises) do
    (1..3).map do |i|
      create :training_exercise, id: i, duration: 10 * i,
             exercise_id: 1, training_id: training.id,
             series_number: 5 * i
    end
  end
  let(:form) do
    double('form', name: 'name2',
           exercises_ids: training_exercises.map(&:id),
           exercises_duration: [1, 2, 3],
           exercises_series_number: [3, 4, 5],
           training_exercises_ids: training_exercises.map(&:id)
    )
  end

  it 'updates training name' do
    expect { subject.call }.to change { training.reload.name }.from('name1').to('name2')
  end

  it 'updates training_exercises duration' do
    expect { subject.call }
      .to change { training_exercises.map{ |e| e.reload.duration } }
      .from([10, 20, 30])
      .to([1, 2, 3])
  end

  it 'updates training_exercises series number' do
    expect { subject.call }
      .to change { training_exercises.map{ |e| e.reload.series_number } }
            .from([5, 10, 15])
            .to([3, 4, 5])
  end
end