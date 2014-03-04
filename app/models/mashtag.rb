class Mashtag < ActiveRecord::Base

	validates_uniqueness_of :user_name

	extend FriendlyId
	friendly_id :user_name, use: :slugged
end
