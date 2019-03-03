class CreateExerciseToMuscles < ActiveRecord::Migration[5.1]
  def change
    create_table :exercise_to_muscles do |t|
      t.integer :muscle_id
      t.integer :exercise_id
      t.integer :body_part_id
      t.string :muscle_type

    end
  end
end
