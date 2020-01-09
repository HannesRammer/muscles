class CreateTrainingsplanToUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :trainingsplan_to_users do |t|
      t.integer :user_id
      t.integer :trainingsplan_id
      t.timestamps
    end
  end
end
