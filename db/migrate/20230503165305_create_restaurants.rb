class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :city
      t.string :photo_url
      t.references :table, null: false, foreign_key: true

      t.timestamps
    end
  end
end
