class ExercisesController < ApplicationController
  expose(:form) { ExerciseForm.new(params) }
  expose(:edit_form) { EditExerciseForm.new(params, exercise) }
  expose(:exercises) { Exercise.all }
  expose(:exercise) { Exercise.find(params['id']) }
  def new; end

  def create
    return redirect_to exercises_path if Exercise.create(exercise_params)
    render :new
  end

  def edit; end

  def update
    if edit_form.valid? && exercise.update(exercise_params)
      flash[:success] = 'Ćwiczenie zostało zaktualizowane'
      redirect_to exercises_path
    else
      render :new
    end
  end

  def index; end

  def destroy
    exercise.destroy
    flash[:success] = 'Ćwiczenie zostało usunięte'
    redirect_to exercises_path
  end

  private

  def exercise_params
    params.permit(:name, :description)
  end
end
