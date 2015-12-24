class ExercisesController < ApplicationController
  expose(:form) { ExerciseForm.new(params) }
  expose(:exercises) { Exercise.all }
  expose(:exercise) { Exercise.find(params['id']) }
  def new; end

  def create
    return redirect_to exercises_path if Exercise.create(exercise_params)
    render :new
  end

  def edit; end

  def index; end

  def destroy
    exercise.destroy
    flash[:success] = 'Ćwiczenie zostało usunięte'
    redirect_to exercises_path
  end
end
