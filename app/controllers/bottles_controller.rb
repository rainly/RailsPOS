class BottlesController < ApplicationController
  def index
    @bottles = Bottle.all
  end
  
  def show
    @bottle = Bottle.find(params[:id])
  end
  
  def new
    @bottle = Bottle.new
  end
  
  def create
    @bottle = Bottle.new(params[:bottle])
    if @bottle.save
      flash[:notice] = "Successfully created bottle."
      redirect_to @bottle
    else
      render :action => 'new'
    end
  end
  
  def edit
    @bottle = Bottle.find(params[:id])
  end
  
  def update
    @bottle = Bottle.find(params[:id])
    if @bottle.update_attributes(params[:bottle])
      flash[:notice] = "Successfully updated bottle."
      redirect_to @bottle
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @bottle = Bottle.find(params[:id])
    @bottle.destroy
    flash[:notice] = "Successfully destroyed bottle."
    redirect_to bottles_url
  end
end
