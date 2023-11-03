class CreateHomes < ActiveRecord::Migration[7.0]
  def change
    create_table :homes do |t|
      t.string :address, null: false
      t.integer :unit_number 
      t.string :city, null: false
      t.string :state, null: false
      t.string :zipcode, null: false
      t.integer :price, null: false
      t.integer :bedrooms, null: false
      t.float :bathrooms, null: false
      t.integer :square_feet, null: false
      t.float :lot_size, null: false
      t.integer :built_date, null: false
      t.string :property_type, null: false
      t.string :description, null: false
      t.references :seller, null: false, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
