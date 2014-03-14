class UploadController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  skip_before_filter :verify_authenticity_token

  include ApplicationHelper
  # module 'Soundcloud'

  def index
  # # register a client with YOUR_CLIENT_ID as client_id_
  #     @client = SoundCloud.new(:client_id => '0a5a8824df0c97aedb12448786a6f1de')
  #   # get 10 hottest tracks
  #    @tracks = @client.get('/tracks', :limit => 10, :order => 'hotness')
  #   # print each link

  #   # @user = SoundCloud.new({
  #   #   :client_id     => '0a5a8824df0c97aedb12448786a6f1de',
  #   #   :client_secret => 'd57204e408d1cc467f403174788a2397',
  #   #   :username      => 'morganric@gmail.com',
  #   #   :password      => 'Lionking'
  #   # })

  #   # @user_tracks = @user.get('/me/tracks')

  # require 'soundcloud'

  @soundcloud_code = params[:code]
  @soundcloud_access_token = params[:access_token]
  @mixcloud_access_token = params[:mixcloud_access_token]

  end

  def soundcloud

  # create client object with app credentials
  client = Soundcloud.new(:client_id => '0a5a8824df0c97aedb12448786a6f1de',
                          :client_secret => 'd57204e408d1cc467f403174788a2397',
                          :redirect_uri => "#{upload_url}")

  # redirect user to authorize URL
  redirect_to client.authorize_url()

  end

  def mixcloud
    @mixcloud_code = params[:code]


    require 'open-uri'
    require 'json'

    mixcloud_oauth_url = "https://www.mixcloud.com/oauth/access_token?client_id=wpLF5wDyDUQYQJnrFY&redirect_uri=#{mixcloud_post_url}&client_secret=jnu8tAF89tecB99ztdautCUduWXnQTUj&code=#{@mixcloud_code}"

    @result = JSON.parse(open(mixcloud_oauth_url).read)

    @mixcloud_access_token = @result["access_token"]

    if @mixcloud_code != nil
      redirect_to upload_path(:mixcloud_access_token => @mixcloud_access_token)
    else
      respond_to do |format|
        format.html 
      end
    end

  end


end
