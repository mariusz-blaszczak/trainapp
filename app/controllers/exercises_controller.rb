class ExercisesController < ApplicationController
  expose(:form) { ExerciseForm.new(exercise_params) }
  expose(:edit_form) { EditExerciseForm.new(exercise_params, exercise) }
  expose(:exercises) { Exercise.all }
  expose(:exercise) { Exercise.find(params['id']) }

  def new
    @model = NewExercisePresenter.new
  end

  def create
    if form.valid? && Exercise.create(exercise_params)
      flash[:success] = 'Ćwiczenie zostało utworzone'
      return redirect_to exercises_path
    end
    render :new
  end

  def edit
    @model = EditExercisePresenter.new(exercise)
    render :edit, locals: { form: edit_form }
  end

  def update
    if edit_form.valid? && ExerciseUpdater.new(exercise.id, edit_form).call
      flash[:success] = 'Ćwiczenie zostało zaktualizowane'
      redirect_to exercises_path
    else
      render :edit, locals: { form: edit_form }
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
    params.permit(:name, :description, :audio, :double_sided)
  end
end
