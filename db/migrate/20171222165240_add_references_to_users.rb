class AddReferencesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :logs, index: true
  end
end
