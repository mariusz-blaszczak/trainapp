class EditExercisePresenter
  pattr_initialize :exercise

  def audio_file_exists?
    exercise.audio.present? && File.exist?(file_path)
  end

  private

  def file_path
    File.join(Rails.root, 'public', exercise.audio)
  end
end
