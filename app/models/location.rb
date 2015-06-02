# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  name       :text
#  city       :string
#  postcode   :integer
#  country    :string
#  state      :string
#  lat        :string
#  long       :string
#  created_at :datetime
#  updated_at :datetime
#

class Location < ActiveRecord::Base
	has_many :events
	has_many :users
end
