class CreateCategoriesEvents < ActiveRecord::Migration
  def change
    create_table :categories_events do |t|
    	t.integer :category_id
    	t.integer :event_id
    end
  end
end
