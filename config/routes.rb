Aulos::Application.routes.draw do
  resources :events

  resources :products

  resources :instruments

  resources :users

  resources :orders

  resources :parts

  resources :people do
    collection do
      get "autocomplete"
    end
  end

  resources :projects do
    member do
      get "add_member"
      post "save_member"
      delete "remove_member"
    end
    
    resources :conductors, :except => :index
    
    resources :plays do
      resources :parts
    end
    
  end
  
  resources :conductors, :only => :index
  
  resources :memberships
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  root :to => "root#index"
  
  match 'login' => "admin#login"
  
  match 'select_products' => "carts#select_products"
  match 'add_to_cart' => "carts#add_to_cart"
  
  match "about" => "root#about"
  match "gallery" => "root#gallery"
  match "contact" => "root#contact"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id(.:format)))'
end
