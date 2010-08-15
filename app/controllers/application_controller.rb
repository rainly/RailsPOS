# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

 
  
  helper_method :current_user
  helper_method :beer_styles
  helper_method :beer_distributors
  helper_method :beer_volumes
  helper_method :beer_glasses
  helper_method :county_tax
  
  helper_method :tab_types
  helper_method :transaction_types
  
  private
  
  def tab_types
     ["Quick", "Sale", "Register", "Bull"]
  end
  
  def transaction_types
     ["CashDeposit", "CreditDeposit", "CashWithdrawal", "CashDeposit"]
  end
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  def beer_styles
     ["Ales", "Lagers", "Stouts & Porters"]
  end
  
  def beer_distributors
     ["Morris Distributing", "Wine Warehouse", "Bay Area Distributing", "Mesa", "Chrissa"]
  end
  
  def beer_volumes
     ["ml", "oz", "gal","l"]
  end
  
  def beer_glasses
     ["Tulip", "Mug", "Willi Beecher","Hefeweizen", "Imperial Pint", "Water Glass"]
  end
  
  def county_tax
     ["0.09"]
  end
end
