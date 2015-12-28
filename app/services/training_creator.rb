class TrainingCreator
  pattr_initialize :form
  attr_reader :traning

  def call
    @training = Training.create(name: form.name)
    form.exercises_ids.each_with_index do |exercise_id, index|
      TrainingExercise.create(
        exercise_id: exercise_id,
        duration: form.exercises_duration[index],
      )
    end
  end

  private

  def exercises
    Exercise.where('ID in (?)', form.exercises_ids)
  end

  def save
  end
end
