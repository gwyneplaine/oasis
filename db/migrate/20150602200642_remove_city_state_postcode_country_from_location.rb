class RemoveCityStatePostcodeCountryFromLocation < ActiveRecord::Migration
  def change
  	remove_column :locations, :state
  	remove_column :locations, :city
  	remove_column :locations, :postcode 
  	remove_column :locations, :country
  	add_column :locations, :address, :text
  end
end
