class CreateEventsLocations < ActiveRecord::Migration
  def change
    create_table :events_locations do |t|
    	t.integer :event_id
    	t.integer :location_id
    end
  end
end
