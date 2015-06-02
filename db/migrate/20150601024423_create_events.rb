class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.text :name
    	t.date :date
    	t.time :start_time
    	t.time :end_time
    	t.text :description
    	t.integer :location_id
    	t.text :image
    	t.timestamps
    end
  end
end
