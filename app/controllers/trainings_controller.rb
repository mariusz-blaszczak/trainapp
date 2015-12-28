class TrainingsController < ApplicationController
  expose(:trainings) { Training.all }

  def index
  end
end
