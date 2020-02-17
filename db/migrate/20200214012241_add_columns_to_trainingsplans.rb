class AddColumnsToTrainingsplan < ActiveRecord::Migration[5.1]
  def change
    add_column :trainingsplans,:crteator_id,:integer
    add_column :trainingsplans,:copied_from_trainingsplan_id,:integer
  end
end
