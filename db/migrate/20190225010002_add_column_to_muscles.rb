class AddColumnToMuscles < ActiveRecord::Migration[5.1]
  def change
    add_column :muscles, :picture_id, :integer
  end
end
