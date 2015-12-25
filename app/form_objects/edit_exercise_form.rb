class EditExerciseForm < ExerciseForm
  attr_reader :exercise, :params

  def initialize(params, exercise)
    @exercise = exercise
    @params = params
    super(build_params_from_exercise)
  end

  def build_params_from_exercise
    {
      name: params[:name] || exercise.name,
      description: params[:description] || exercise.description
    }
  end
end
