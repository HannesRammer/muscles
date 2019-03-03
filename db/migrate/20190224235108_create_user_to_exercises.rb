class CreateUserToExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :user_to_exercises do |t|
      t.integer :user_id
      t.integer :exercise_id

      t.timestamps
    end
  end
end
