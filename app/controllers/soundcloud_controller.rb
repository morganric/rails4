class SoundcloudController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  skip_before_filter :verify_authenticity_token

  include ApplicationHelper
  # module 'Soundcloud'

  def index
  # register a client with YOUR_CLIENT_ID as client_id_
      @client = SoundCloud.new(:client_id => '0a5a8824df0c97aedb12448786a6f1de')
    # get 10 hottest tracks
     @tracks = @client.get('/tracks', :limit => 10, :order => 'hotness')
    # print each link

    @user = SoundCloud.new({
      :client_id     => '0a5a8824df0c97aedb12448786a6f1de',
      :client_secret => 'd57204e408d1cc467f403174788a2397',
      :username      => 'morganric@gmail.com',
      :password      => 'Lionking'
    })

    # @user_tracks = @user.get('/me').tracks
  
  end


end
