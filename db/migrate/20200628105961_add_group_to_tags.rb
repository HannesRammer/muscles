class AddGroupToTags < ActiveRecord::Migration[5.1]
  def change
    add_column :tags, :group, :integer
  end
end
