class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :LastName
      t.integer :startWeight
      t.integer :goalWeight

      t.timestamps
      
    end
  end
end
