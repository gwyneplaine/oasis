class CreateEventsTimelines < ActiveRecord::Migration
  def change
    create_table :events_timelines do |t|
    	t.integer :event_id
    	t.integer :timeline_id
    end
  end
end
