class MiscsController < ApplicationController
  def index
    @miscs = Misc.all
  end
  
  def show
    @misc = Misc.find(params[:id])
  end
  
  def new
    @misc = Misc.new
  end
  
  def create
    @misc = Misc.new(params[:misc])
    if @misc.save
      flash[:notice] = "Successfully created misc."
      redirect_to @misc
    else
      render :action => 'new'
    end
  end
  
  def edit
    @misc = Misc.find(params[:id])
  end
  
  def update
    @misc = Misc.find(params[:id])
    if @misc.update_attributes(params[:misc])
      flash[:notice] = "Successfully updated misc."
      redirect_to @misc
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @misc = Misc.find(params[:id])
    @misc.destroy
    flash[:notice] = "Successfully destroyed misc."
    redirect_to miscs_url
  end
end
