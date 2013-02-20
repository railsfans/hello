Hello::Application.routes.draw do

  resources :captchas
  # get "/doors/sign_in" => "session#new"
  # post "/doors/sign_in"    => "session#create"
  # get "/doors/sign_out" => "session#destroy"
   get "session/new" =>"session#new"
   post "session/create" =>"session#create"
   get "session/destroy" => "session#destroy"
 
   devise_for :doors, :controllers=>{ :session =>'session'}, :skip=>[:sessions] do
  get '/doors/sign_in' => 'session#new', :as => :new_door_session
post '/doors/sign_in' => 'session#create', :as => :door_session
get '/doors/sign_out' => 'session#destroy', :as => :destroy_door_session
end
  
  get "search/index", :as=>"search"

  get "user/index", :as=>"user"
  match "posts/:id/active"=>"posts#active", :as=>"active_post"
   match "posts/:id/unactive"=>"posts#unactive", :as=>"unactive_post"
  resources :user
  resources :posts
  
  resources :products
  match "products#refresh"=>"products#refresh", :as=>"refresh"

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

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => 'user#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end
