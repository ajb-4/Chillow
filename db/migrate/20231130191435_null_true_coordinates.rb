class NullTrueCoordinates < ActiveRecord::Migration[7.0]
  def change
    change_column :homes, :latitude, :float, null: true
    change_column :homes, :longitude, :float, null: true
  end
end
