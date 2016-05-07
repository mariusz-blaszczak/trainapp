class TrainingUpdater
  pattr_initialize :form, :training_id

  def call
    update_training
    update_or_create_training_exercises
  end

  private

  def update_training
    Training.find(training_id).update(name: form.name)
  end

  # noinspection RubyInstanceMethodNamingConvention
  def update_or_create_training_exercises
    attributes_array = EditTrainingFormToUpdateTrainingExercisesAttributesAdapter
                        .new(form)
                        .call
    attributes_array.each do |attributes_hash|
      update_or_create_training_exercise(attributes_hash)
    end
  end

  # noinspection RubyInstanceMethodNamingConvention
  def update_or_create_training_exercise(attributes_hash)
    TrainingExercise.create(attributes_hash) if attributes_hash[:id].nil?
    TrainingExercise.find(attributes_hash[:id]).update!(attributes_hash)
  end
end
