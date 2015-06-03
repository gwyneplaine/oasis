class ChangeLatlongInLocations < ActiveRecord::Migration
  def change
  	remove_column :locations, :long 
  	add_column :locations, :longitude, :float
  	remove_column :locations, :lat
  	add_column :locations, :latitude, :float
  end
end
