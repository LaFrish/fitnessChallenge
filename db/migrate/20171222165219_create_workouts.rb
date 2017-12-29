class CreateWorkouts < ActiveRecord::Migration[5.0]
  def change
    create_table :workouts do |t|
      t.date   :date
      t.boolean :goalMet
      t.integer :hours
      t.integer :workoutPoint
      t.integer :points
      t.string :workoutType
      t.integer :caloriesBurned
      t.time :workoutTime
      t.integer :workedoutTime
      t.integer :workoutGoal

      t.timestamps
      t.references :user, index: true
      t.references :log, index: true
      t.references :goal, index: true
    end
  end
end
