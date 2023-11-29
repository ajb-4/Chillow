class CoordinateNullFalse < ActiveRecord::Migration[7.0]
  def change
    change_column :homes, :latitude, :float, null: false
    change_column :homes, :longitude, :float, null: false
  end
end
