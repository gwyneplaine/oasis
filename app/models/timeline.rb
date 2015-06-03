# == Schema Information
#
# Table name: timelines
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  name       :string
#

class Timeline < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :events
end
