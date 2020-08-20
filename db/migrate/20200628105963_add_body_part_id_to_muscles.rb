class AddBodyPartIdToMuscles < ActiveRecord::Migration[5.2]
  def change
    add_column :muscles, :body_part_id, :integer
  end
end
