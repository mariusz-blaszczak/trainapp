class AddDoubleSidedToExercise < ActiveRecord::Migration
  def change
    add_column :exercises, :double_sided, :boolean
  end
end
