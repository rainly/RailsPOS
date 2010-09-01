class TabsController < ApplicationController
  def index
    @tabs = Tab.all
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def show
    @tab = Tab.find(params[:id])
    session['tab'] = @tab.id
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def new
    @tab = Tab.new
    @types = {:type => "Sale", :type => "Register"}
  end
  
  def create
    @tab = Tab.new(params[:tab])
    if @tab.save
      respond_to do |format|
        format.html do
          flash[:notice] = "Successfully created tab."
          redirect_to @tab
        end
        format.js
      end
    end
  end
  
  def edit
    @tab = Tab.find(params[:id])
  end
  
  def update
    @tab = Tab.find(params[:id])
    if @tab.update_attributes(params[:tab])
      flash[:notice] = "Successfully updated tab."
      redirect_to @tab
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @tab = Tab.find(params[:id])
    @tab.destroy
    flash[:notice] = "Successfully destroyed tab."
    redirect_to tabs_url
  end
end
