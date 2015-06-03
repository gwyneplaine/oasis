class AddAddressToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :address, :text
  end
end
