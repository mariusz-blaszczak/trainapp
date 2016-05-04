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
      name: params[:name] || training.name
    }
  end
end
