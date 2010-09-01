class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.all
  end
  
  def show
    @purchase = Purchase.find(params[:id])
  end
  
  def new
    @purchase = Purchase.new
    @tabs = Tab.all
  end
  
  def create
    if !params[:ipad].blank?
      @purchase = Purchase.new(params[:purchase])
      @purchase.save
      redirect_to :controller => 'tabs', :action => 'show', :id => @purchase.tab_id, :format => 'js'
    else
      @purchase = Purchase.new(params[:purchase])
      if @purchase.save
        flash[:notice] = "Successfully created purchase."
        redirect_to @purchase
      else
        render :action => 'new'
      end
    end
  end
  
  def edit
    @purchase = Purchase.find(params[:id])
  end
  
  def update
    @purchase = Purchase.find(params[:id])
    respond_to do |format|
      format.html do
        if @purchase.update_attributes(params[:purchase])
          flash[:notice] = "Successfully updated purchase."
          redirect_to @purchase
        else
          render :action => 'edit'
        end
      end
      format.js do
        @purchase.update_price(params[:purchase])
        if @purchase.save
          flash[:notice] = "Successfully updated purchase."
          #render :json => {:msg => 'success'}.to_json
          @tab = Tab.find_by_id(@purchase.tab_id)
        else
          render :json => {:msg => 'fail'}, :status => 500
        end
      end
    end
  end
  
  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy
    flash[:notice] = "Successfully destroyed purchase."
    redirect_to purchases_url
  end
end
