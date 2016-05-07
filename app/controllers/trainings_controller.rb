class TrainingsController < ApplicationController
  expose(:form) { TrainingForm.new(params) }
  expose(:edit_form) { EditTrainingForm.new(params, training) }
  expose(:trainings) { Training.all }
  expose(:training) { Training.find(params['id']) }
  expose(:exercises) { Exercise.all }

  def new
  end

  def create
    if form.valid? && TrainingCreator.new(form).call
      flash[:success] = 'Trening został utworzony'
      return redirect_to trainings_path
    end
    render :new
  end

  def edit
    render :edit, locals: { form: edit_form }
  end

  def update
    if edit_form.valid? && TrainingUpdater.new(form, training).call
      flash[:success] = 'Trening zaktualizowany'
      redirect_to trainings_path
    else
      render :edit
    end
  end

  def index
  end

  def destroy
    training.destroy
    flash[:success] = 'Ćwiczenie zostało usunięte'
    redirect_to trainings_path
  end

  private

  def training_params
    params.permit(:name, :exercises)
  end
end
