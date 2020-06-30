class CreateTagToExercise < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_to_exercise do |t|
      t.integer :tag_id
      t.integer :exercise_id
      t.timestamps
    end
  end
end
