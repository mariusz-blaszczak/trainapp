class EditTrainingForm < TrainingForm
  attr_reader :params, :training

  def initialize(params, training)
    @params = params
    @training = training
    super(build_params_from_training)
  end

  private

  def build_params_from_training
    {
      name: params[:name] || training.name,
      exercises_series_number: params[:exercises_series_number] || exercises_series_numbers,
      exercises_duration: params[:exercises_duration] || exercises_durations
    }
  end

  def exercises_durations
    training.training_exercises.map { |e| e.duration }
  end

  def exercises_series_numbers
    training.training_exercises.map { |e| e.series_number }
  end
end
