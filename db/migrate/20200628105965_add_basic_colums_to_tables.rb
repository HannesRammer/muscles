class AddBasicColumsToTables < ActiveRecord::Migration[5.2]
  def change
    create_table :following_relationships do |t|
      t.belongs_to :follower
      t.belongs_to :followed_user
      t.timestamps
    end

    add_column :videos, :duration, :string#:decimal , precision: 10, scale: 2#in seconds
    add_column :videos, :name,:string# :text #in seconds
    add_column :trainingsplans, :public, :boolean
    add_column :trainingsplans, :tags, :text
    add_column :trainingsplans, :duration, :string#:decimal, precision: 10, scale: 2
    add_column :trainingsplans, :played, :string#:decimal, precision: 10, scale: 2
  end

end
