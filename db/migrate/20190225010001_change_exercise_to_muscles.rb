class ChangeExerciseToMuscles < ActiveRecord::Migration[5.1]
  def up
    add_column :exercise_to_muscles, :active, :boolean

    ExerciseToMuscle.all.each do |x|
      if x.muscle_type == "antagonistic"
        x.active = false
      else
        x.active = true
      end
      x.save
    end

  end

  def down
    remove_column :exercise_to_muscles, :active
  end
end
