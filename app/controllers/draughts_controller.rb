class DraughtsController < ApplicationController
  def index
    @draughts = Draught.all
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def show
    @draught = Draught.find(params[:id])
  end
  
  def new
    @draught = Draught.new
  end
  
  def create
    @draught = Draught.new(params[:draught])
    if @draught.save
      flash[:notice] = "Successfully created draught."
      redirect_to @draught
    else
      render :action => 'new'
    end
  end
  
  def edit
    @draught = Draught.find(params[:id])
  end
  
  def update
    @draught = Draught.find(params[:id])
    if @draught.update_attributes(params[:draught])
      flash[:notice] = "Successfully updated draught."
      redirect_to @draught
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @draught = Draught.find(params[:id])
    @draught.destroy
    flash[:notice] = "Successfully destroyed draught."
    redirect_to draughts_url
  end
end
