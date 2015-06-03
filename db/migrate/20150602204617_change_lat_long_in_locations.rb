class ChangeLatLongInLocations < ActiveRecord::Migration
  def change
  	remove_column :locations, :lat
  	add_column  :locations, :lat, :float
  	remove_column :locations, :long
  	add_column :locations, :long, :float
  end
end
