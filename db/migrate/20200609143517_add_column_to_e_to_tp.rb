class AddColumnToEToTp < ActiveRecord::Migration[5.1]
  def change
    add_column :exercise_to_trainingsplans, :video_id, :text
  end
end
