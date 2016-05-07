class EditTrainingForm < TrainingForm
  attr_reader :params, :training
  attribute :training_exercises_ids, Array[Integer]

  def initialize(params, training)
    @params = params
    @training = training
    super(build_params_from_training)
  end

  private

  def build_params_from_training
    {
      name: params[:name] || training.name
    }
  end
end
