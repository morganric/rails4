class Embed::MashtagsController < EmbedController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  skip_before_filter :verify_authenticity_token

  include ApplicationHelper
  include MashtagsHelper

  def index
    @mashtags = Mashtag.all.order(:views).reverse
    @mashtag = Mashtag.first
    @params = params
    signed_request = params[:signed_request]
    
      respond_to do |format|
        format.html
      end

  end

  def about
    @mashtags = Mashtag.all.reverse

    respond_to do |format|
      format.html
    end
  end

  def show
    @mashtag = Mashtag.friendly.find(params[:id])
    @mixcloud_user = Mixcloud::User.new("http://api.mixcloud.com/#{@mashtag.user_name}")

    cloud(@mashtag)
    views(@mashtag)

    redirect_to do |format|
      format.html   { :controller => 'mashtags', :action => 'show', :layout => 'embed'}
    end

  end

  def create

    @mashtag = Mashtag.new(:user_name => params[:user_name])

    if @mashtag.save
      flash[:notice] = "Mashtag successfully created"
      redirect_to mashtags_path
    else
      flash[:notice] = "Mashtag not created"
      redirect_to mashtags_path
    end

  end

  def facebook

    @mashtag = Mashtag.find_by_user_name(params[:facebook_page_tab]["user_name"])
    @mashtag.facebook_page_id = params[:facebook_page_tab]["facebook_page_id"]

    if @mashtag.save
      flash[:notice] = "Facebook successfully created"
      respond_to do |format|
        format.js
      end
    else
      flash[:notice] = "Facebookk not created"
      respond_to do |format|
        format.js 
      end
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

  def mashtag_params
      params.require(:mashtag).permit(:user_name, :slug, :facebook_page_id, :signed_request)
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
