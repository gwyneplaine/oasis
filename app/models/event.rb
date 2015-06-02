# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :text
#  date        :date
#  start_time  :time
#  end_time    :time
#  description :text
#  location_id :integer
#  image       :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Event < ActiveRecord::Base
	belongs_to :location
	has_and_belongs_to_many :categories
	has_and_belongs_to_many :users
end
