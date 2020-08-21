class AddMusclesToExercises < ActiveRecord::Migration[5.2]
  def change
    add_column :exercises, :primary_muscle_ids, :string
    add_column :exercises, :secondary_muscle_ids, :string
  end

end
