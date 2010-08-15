class DrawersController < ApplicationController
  def index
    @drawers = Drawer.all
  end
  
  def show
    @drawer = Drawer.find(params[:id])
  end
  
  def new
    @drawer = Drawer.new
  end
  
  def create
    @drawer = Drawer.new(params[:drawer])
    if @drawer.save
      flash[:notice] = "Successfully created drawer."
      redirect_to @drawer
    else
      render :action => 'new'
    end
  end
  
  def edit
    @drawer = Drawer.find(params[:id])
  end
  
  def update
    @drawer = Drawer.find(params[:id])
    if @drawer.update_attributes(params[:drawer])
      flash[:notice] = "Successfully updated drawer."
      redirect_to @drawer
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @drawer = Drawer.find(params[:id])
    @drawer.destroy
    flash[:notice] = "Successfully destroyed drawer."
    redirect_to drawers_url
  end
end
