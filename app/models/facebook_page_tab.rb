class FacebookPageTab < ActiveRecord::Base

	validates_uniqueness_of :facebook_page_id
end
