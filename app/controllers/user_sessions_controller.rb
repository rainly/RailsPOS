class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Successfully logged in."
      redirect_to ipad_url
    else
      flash[:notice] = "Login Failed"
      redirect_to ipad_url
    end
  end
  
  def destroy
    session['tab'] = nil
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully logged out."
    respond_to do |format|
      format.html {redirect_to root_url}
      format.js
    end
    
  end
end
