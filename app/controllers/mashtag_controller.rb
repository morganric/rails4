class MashtagController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  skip_before_filter :verify_authenticity_token

  include ApplicationHelper

  def index

    require 'mixcloud'
    @makoto = Mixcloud::User.new('http://api.mixcloud.com/makoto')


    respond_to do |format|
      format.html {render layout: "mashtag"}
    end
  end


  def search

    query = params[:search]
    
    if query 
      @results = search_mixcoud(query)
      return @results 
    end

    @results = @results ? ['test0', 'test1', 'test2'] : []

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

  def search_mixcoud term 
    search = Mixcloud::Search.find_artist(term)
    return search
  end


end
