class CreateBodyParts < ActiveRecord::Migration[5.1]
  def change
    create_table :body_parts do |t|
      t.string :name

    end
  end
end
