class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # def fb_liked?
  #   session[:signed_request]['page']['liked'] if session[:signed_request]
  # end
 
  # def fb_admin?
  #   session[:signed_request]['page']['admin'] if session[:signed_request]
	 #  end
		
  # def fb_page?
  #   session[:signed_request]['page']['id'] if session[:signed_request]
  # end	

  # helper_method :fb_liked?, :fb_admin?, :fb_page?
 
  # before_filter do
  #   if params[:signed_request]
  #     oauth = Koala::Facebook::OAuth.new(ENV['FB_APP_ID'], ENV['FB_APP_SECRET'])
  #     session[:signed_request] = oauth.parse_signed_request(params[:signed_request])
  #   end
  # end

end
