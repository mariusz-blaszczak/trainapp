# Convert EditTrainingForm values to match TrainingExercise attributes
class EditTrainingFormToUpdateTrainingExercisesAttributesAdapter
  rattr_initialize :form

  def call
    prepare_attributes_array
  end

  private

  def prepare_attributes_array
    attributes_array_indices.map do |index|
      prepare_attributes_hash(index)
    end
  end

  def attributes_array_indices
    (0...form.exercises_ids.length)
  end

  def prepare_attributes_hash(index)
    {
      exercise_id: form.exercises_ids[index],
      duration: form.exercises_duration[index],
      series_number: form.exercises_series_number[index],
      id: nil_if_blank(form.training_exercises_ids[index])
    }
  end

  def nil_if_blank(id)
    id unless id.blank?
  end
end