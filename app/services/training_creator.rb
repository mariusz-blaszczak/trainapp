class TrainingCreator
  pattr_initialize :form

  def call
    create_training_exercises
  end

  private

  def create_training_exercises
    form.exercises_ids.each_with_index do |exercise_id, index|
      create_training_exercise(exercise_id, index)
    end
  end

  def create_training_exercise(exercise_id, index)
    TrainingExercise.create(
      exercise_id: exercise_id,
      duration: form.exercises_duration[index],
      training_id: training.id,
    )
  end

  def training
    @training ||= Training.create(name: form.name)
  end

  def exercises
    Exercise.where('ID in (?)', form.exercises_ids)
  end
end
