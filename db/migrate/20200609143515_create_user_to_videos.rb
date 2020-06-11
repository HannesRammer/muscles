class CreateUserToVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :user_to_videos do |t|
      t.integer :user_id
      t.integer :video_id

      t.timestamps
    end
  end
end
