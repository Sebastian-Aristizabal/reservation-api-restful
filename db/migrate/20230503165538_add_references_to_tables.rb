class AddReferencesToTables < ActiveRecord::Migration[7.0]
  def change
    add_reference :tables, :restaurant, null: false, foreign_key: true
  end
end
