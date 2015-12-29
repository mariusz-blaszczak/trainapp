class TrainingsController < ApplicationController
  expose(:form) { TrainingForm.new(params) }
  expose(:trainings) { Training.all }
  expose(:training) { Training.find(params['id']) }

  def new
  end

  def create
    if form.valid? && TrainingCreator.new(form).call
      flash[:success] = 'Trening został utworzony'
      return redirect_to trainings_path
    end
    render :new
  end

  def index
  end

  def destroy
    training.destroy
    flash[:success] = 'Ćwiczenie zostało usunięte'
    redirect_to trainings_path
  end

end
