class AddColumnsToExercise < ActiveRecord::Migration[5.1]
  def change
    add_column :exercises,:visible,:boolean ,:default => true
  end
end
