class ExercisesController < ApplicationController
  expose(:form) { ExerciseForm.new(params) }
  expose(:exercises) { Exercise.all }

  def new; end

  def create
    return redirect_to exercises_path if form.save
    render :new
  end

  def index
  end
end
