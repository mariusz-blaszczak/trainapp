class EditExerciseForm < ExerciseForm
  attr_reader :exercise, :params

  def initialize(params, exercise)
    @exercise = exercise
    @params = params
    super(build_params_from_exercise.compact)
  end

  def build_params_from_exercise
    {
      audio: params[:audio] || exercise.audio || generate_audio_file_name,
      name: params[:name] || exercise.name,
      description: params[:description] || exercise.description,
    }
  end
end
