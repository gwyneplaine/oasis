# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime
#  updated_at :datetime
#  address    :text
#  longitude  :float
#  latitude   :float
#

class Location < ActiveRecord::Base
	has_many :events
	has_many :users
	geocoded_by :address
	after_validation :geocode
end
