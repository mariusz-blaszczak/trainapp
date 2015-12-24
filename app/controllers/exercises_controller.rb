class ExercisesController < ApplicationController
  def new
    @form = ExerciseForm.new(params)
  end

  def create
    @form = QuoteForm.new(params)
    return redirect_to exercises_path if @form.save?
    render :new
  end

  def index; end
end
