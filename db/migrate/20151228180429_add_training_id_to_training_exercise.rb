class AddTrainingIdToTrainingExercise < ActiveRecord::Migration
  def change
    add_column :training_exercises, :training_id, :integer
  end
end
