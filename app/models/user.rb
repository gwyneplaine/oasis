# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  username        :string
#  password_digest :string
#  is_admin        :boolean          default(FALSE)
#  location_id     :integer
#  image           :text
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
	belongs_to :location
	has_and_belongs_to_many :events
	has_secure_password

	validates :username, :presence => true
	validates :username, :uniqueness => true
end
