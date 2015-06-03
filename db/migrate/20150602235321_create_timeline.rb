class CreateTimeline < ActiveRecord::Migration
  def change
    create_table :timelines do |t|
    	t.integer :user_id
    	t.timestamps
    	t.string :name
    end
  end
end
