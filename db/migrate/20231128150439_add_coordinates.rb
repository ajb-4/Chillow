class AddCoordinates < ActiveRecord::Migration[7.0]
  def change
    add_column :homes, :latitude, :float
    add_column :homes, :longitude, :float
  end
end
