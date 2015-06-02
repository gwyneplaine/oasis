class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
    	t.text :name
    	t.string :city
    	t.integer :postcode
    	t.string :country
    	t.string :state
    	t.string :lat
    	t.string :long
    	t.timestamps
    end
  end
end
