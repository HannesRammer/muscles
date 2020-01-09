class CreateExerciseToTrainingsplans < ActiveRecord::Migration[5.1]
  def change
    create_table :exercise_to_trainingsplans do |t|
      t.integer :trainingsplan_id
      t.integer :exercise_id
      t.timestamps
    end
  end
end
