class ExerciseUpdater
  pattr_initialize :exercise_id, :form

  def call
    update_exercise
  end

  private

  def update_exercise
    Exercise.find(exercise_id)
      .update(name: form.name, description: form.description,
              audio: form.audio, double_sided: form.double_sided)
  end
end
