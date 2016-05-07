class AddSeriesNumberToTrainingExercise < ActiveRecord::Migration
  def change
    add_column :training_exercises, :series_number, :integer
  end
end
