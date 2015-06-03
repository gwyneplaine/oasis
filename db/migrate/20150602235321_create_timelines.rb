class CreateTimelines < ActiveRecord::Migration
  def change
    create_table :timelines do |t|
    	t.timestamps
    	t.integer :user_id
    	t.string :name
    end
  end
end
