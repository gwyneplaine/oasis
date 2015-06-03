# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime
#  updated_at :datetime
#  address    :text
#  lat        :float
#  long       :float
#

class Location < ActiveRecord::Base
	has_many :events
	has_many :users
end
