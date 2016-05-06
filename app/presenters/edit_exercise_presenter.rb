class EditExercisePresenter
  pattr_initialize :exercise

  def audio_file_exists?
    exercise.audio.present? && exercise.audio.file.exists?
  end
end
