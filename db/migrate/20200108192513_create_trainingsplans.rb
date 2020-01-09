class CreateTrainingsplans < ActiveRecord::Migration[5.1]
  def change
    create_table :trainingsplans do |t|
      t.string :name

      t.timestamps
    end
  end
end
