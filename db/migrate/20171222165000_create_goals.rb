class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.integer :waterGoal
      t.integer :waterPoint
      t.integer :weightGoal
      t.integer :weightPoint
      t.integer :sleepPoint
      t.integer :sleepGoal
      t.integer :workoutGoal
      t.integer :workoutPoint
      t.integer :foodPoint
      t.integer :foodGoal
      t.timestamps

      t.references :user, index: true

    end
  end
end
