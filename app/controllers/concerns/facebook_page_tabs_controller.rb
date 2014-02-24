class FacebookPageTabsController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def create
    @facebook_page_tab = FacebookPageTab.new(facebook_page_tab_params)

    respond_to do |format|
      if @facebook_page_tab.save
        format.js 
      else
        format.js
      end
    end
  	
  end

  def update
    
  end

  def destroy
    
  end

  private

   # Never trust parameters from the scary internet, only allow the white list through.
    def facebook_page_tab_params
      params.require(:facebook_page_tab).permit(:competition_id, :facebook_page_id)
    end


end
