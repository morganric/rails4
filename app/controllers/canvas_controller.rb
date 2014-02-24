class CanvasController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  skip_before_filter :verify_authenticity_token

  include ApplicationHelper

  def index
    @competitions = Competition.all
    @params = params
    signed_request = params[:signed_request]

    if signed_request
      @signed_request = decode_data(signed_request)

      if @signed_request["page"] != nil
        page_id = @signed_request["page"]["id"]
        competition_id = FacebookPageTab.where(:facebook_page_id => page_id)[0]["competition_id"]
        @competition = Competition.find(competition_id)
        redirect_to competition_path(@competition)
      else
        respond_to do |format|
          format.html 
        end
      end
  	end

  
  end


  private

  def base64_url_decode str
     encoded_str = str.gsub('-','+').gsub('_','/')
     encoded_str += '=' while !(encoded_str.size % 4).zero?
     Base64.decode64(encoded_str)
  end

  def decode_data str
    encoded_sig, payload = str.split('.')
    data = ActiveSupport::JSON.decode base64_url_decode(payload)
  end


end
