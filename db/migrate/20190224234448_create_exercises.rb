class CreateExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :image1
      t.text :description
      t.string :image2
      t.text :main_description
      t.text :how_to
      t.text :how_not_to
      t.text :info
      t.string :exercise_type

    end
  end
end
