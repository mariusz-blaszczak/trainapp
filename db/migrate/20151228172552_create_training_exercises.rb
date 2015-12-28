class CreateTrainingExercises < ActiveRecord::Migration
  def change
    create_table :training_exercises do |t|
      t.integer :exercise_id
      t.integer :duration

      t.timestamps null: false
    end
  end
end
