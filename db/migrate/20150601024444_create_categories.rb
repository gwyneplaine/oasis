class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
    	t.string :name
    	t.text :description
    	t.string :slug
    	t.timestamps
    	t.text :image
      	t.timestamps 
    end
  end
end
