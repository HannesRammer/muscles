class AddColumnToExercise < ActiveRecord::Migration[5.1]
  def change
    add_column :exercises,:default_video_id,:integer
  end
end
