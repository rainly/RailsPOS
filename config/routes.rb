ActionController::Routing::Routes.draw do |map|
  map.resources :printers
  map.print 'printer/print/:id', :controller => 'printers', :action => 'print'
  

  map.ipad "ipad", :controller => "ipads", :action => "index"
  map.admin "admin", :controller => "users", :action => "index"

  map.resources :drawers, :has_many => :tabs
  map.resources :purchases
  map.resources :transactions
  
  map.resources :cash_deposits, :controller => 'transactions'
  map.resources :cash_withdrawls, :controller => 'transactions'
  map.resources :credit_deposits, :controller => 'transactions'
  map.resources :credit_withdrawals, :controller => 'transactions'

  map.resources :sales, :controller => 'tabs'
  map.resources :quicks, :controller => 'tabs'
  map.resources :registers, :controller => 'tabs'

  map.resources :tabs, :has_many => :purchases, :shallow => true
  map.resources :tabs, :has_many => :transactions, :shallow => true

  map.resources :miscs
  map.resources :foods
  map.resources :bottles
  map.resources :draughts
  
  map.resources :user_sessions
  
  map.resources :users, :has_many => :purchases, :shallow => true
  map.resources :users, :has_many => :transactions, :shallow => true
  map.resources :users, :has_many => :tabs, :shallow => true
  map.resources :users, :has_many => :drawers, :shallow => true

  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "ipads"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
