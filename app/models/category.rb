# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  slug        :string
#  created_at  :datetime
#  updated_at  :datetime
#  image       :text
#

class Category < ActiveRecord::Base
	has_and_belongs_to_many :events
end
