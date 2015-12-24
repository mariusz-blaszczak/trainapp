class ExercisesController < ApplicationController
  expose(:form) { ExerciseForm.new(params) }
  expose(:exercises) { Exercise.all }
  expose(:exercise) { Exercise.find(params['id']) }
  def new; end

  def create
    return redirect_to exercises_path if form.save
    render :new
  end

  def index

  def destroy
    exercise.destroy
    flash[:success] = 'Ćwiczenie zostało usunięte'
    redirect_to exercises_path
  end
end
