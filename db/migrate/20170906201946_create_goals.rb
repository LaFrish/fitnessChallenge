class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.integer :caloricIntake
      t.integer :waterIntake
      t.integer :slept
      t.integer :workout
      t.integer :weeklygoal
      t.integer :weeklyweight
      t.integer :weightlost
      t.integer :weightgain
      t.integer :bonusPoints
      t.integer :totalPoints
      t.integer :weeklyPoints
      t.datetime :created_at
      t.datetime :updated_at
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
