class CreateSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :searches do |t|
      t.integer :price_min
      t.integer :price_max
      t.integer :beds
      t.float :baths
      t.string :home_type
      t.references :searcher, null: false, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
