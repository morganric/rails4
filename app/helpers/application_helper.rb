module ApplicationHelper

# include 'shopify_api'

def shopify_session

	ShopifyAPI::Session.setup({:api_key => '9827c3e04b5723a0a88c8b04efa7d851', :secret => '02484c88529509b26df76daf7c83df42'})
	session = ShopifyAPI::Session.new("ticktack.myshopify.com")
	return session
end

end
