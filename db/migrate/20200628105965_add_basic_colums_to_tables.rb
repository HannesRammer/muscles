class AddBasicColumsToTables < ActiveRecord::Migration[5.2]
  def change
    create_table :following_relationships do |t|
      t.belongs_to :follower
      t.belongs_to :followed_user
      t.timestamps
    end

    add_column :videos, :duration, :decimal #in seconds
    add_column :videos, :name, :decimal #in seconds
    add_column :trainingsplans, :public, :boolean
    add_column :trainingsplans, :tags, :text
    add_column :trainingsplans, :duration, :decimal
    add_column :trainingsplans, :played, :decimal
  end

end
