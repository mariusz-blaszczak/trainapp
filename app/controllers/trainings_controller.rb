class TrainingsController < ApplicationController
  expose(:form) { TrainingForm.new(params) }
  expose(:trainings) { Training.all }

  def new
  end

  def index
  end
end
