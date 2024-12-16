class AddCoordinatesToEvents < ActiveRecord::Migration[7.2]
  def change
    add_column :events, :latitude, :float
    add_column :events, :longitude, :float
  end
end
