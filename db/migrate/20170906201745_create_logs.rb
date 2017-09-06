class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.datetime :weeklyLog
      t.datetime :dailyLog
    
    end
  end
end
