class EditColumnsToTrainingsplans < ActiveRecord::Migration[5.2]
  def change
    remove_column :trainingsplans,:crteator_id
    add_column :trainingsplans,:creator_id,:integer
    add_column :trainingsplans,:sets,:integer
  end
end
