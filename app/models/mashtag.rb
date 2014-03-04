class Mashtag < ActiveRecord::Base

	validates_uniqueness_of :user_name
	validates :user_name, :exclusion => %w(about)

	extend FriendlyId
	friendly_id :user_name, use: :slugged
end
