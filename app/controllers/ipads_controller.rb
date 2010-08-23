class IpadsController < ApplicationController
  layout "ipad"
  
  def index
    unless session['tab'].blank?
      @tab = Tab.find_by_id(session['tab'])
    end
    @user_session = UserSession.new
    @drawer = Drawer.find_all_by_closed_at(nil)
    if @drawer.size == 1 
      session['drawer'] = @drawer.first.id
    else
      session['drawer'] = nil
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def edit 
    @purchase = Purchase.find_by_id(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end
end
