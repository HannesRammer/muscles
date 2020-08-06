class AddColumnsToVideos < ActiveRecord::Migration[5.1]
  def change
    add_column :videos, :youtube_url, :string
    add_column :videos, :start_time, :string
    add_column :videos, :end_time, :string
  end
end
