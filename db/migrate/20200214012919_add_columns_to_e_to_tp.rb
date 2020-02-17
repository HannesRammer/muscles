class AddColumnsToEToTp < ActiveRecord::Migration[5.1]
  def change
    add_column :exercise_to_trainingsplans, :reps, :integer
    add_column :exercise_to_trainingsplans, :duration, :integer
    add_column :exercise_to_trainingsplans, :pause, :integer
    add_column :exercise_to_trainingsplans, :unit, :text
  end
end
