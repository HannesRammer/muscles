class AddColumnEnNameToMuscles < ActiveRecord::Migration[5.1]
  def change
    add_column :muscles, :en_name, :string
  end
end
