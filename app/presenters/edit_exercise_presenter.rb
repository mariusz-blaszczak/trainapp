class EditExercisePresenter
  pattr_initialize :exercise

  def audio_file_exists?
    exercise.audio.present? && File.exist?(file_path)
  end

  private

  def file_path
    Rails.public_path.join(params[:audio])
  end
end
