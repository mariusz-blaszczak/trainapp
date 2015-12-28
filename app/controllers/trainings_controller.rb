class TrainingsController < ApplicationController
  expose(:trainings) { Training.all }

  def new
  end

  def index
  end
end
