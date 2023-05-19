class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.integer :group_size
      t.datetime :booking_date
      t.references :table, null: false, foreign_key: true

      t.timestamps
    end
  end
end
