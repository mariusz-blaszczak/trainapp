class TrainingUpdater
  pattr_initialize :form, :training_id
  attr_reader :training

  def call
    update_training
    wipe_training_exercises
  end

  private

  def update_training
    @training = Training.find(training_id)
    Training.find(training_id).update(name: form.name)
  end

  def wipe_training_exercises
    attributes_array = EditTrainingFormToUpdateTrainingExercisesAttributesAdapter
                        .new(form)
                        .call
    remove_all_training_exercises
    create_new_training_exercises(attributes_array)
  end

  def create_new_training_exercises(attributes_array)
    attributes_array.each do |attributes_hash|
      create_training_exercise(attributes_hash)
    end
  end

  def create_training_exercise(attributes_hash)
    TrainingExercise.create(attributes_hash.merge(training_id: training.id))
  end

  def remove_all_training_exercises
    training.training_exercises.destroy_all
  end
end
