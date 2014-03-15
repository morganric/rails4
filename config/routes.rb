Rails4::Application.routes.draw do
  
  get 'mashtags/about' => 'mashtags#about', :as => 'mashtags_about'
  resources :competitions

  get 'mashtags/facebook' => 'mashtags#facebook'
  post 'mashtags/facebook' => 'mashtags#facebook'

  # scope :constraints => { :protocol => 'https://' } do

  #   get 'soundcloud' => 'soundcloud#index'
  #   post 'soundcloud' => 'soundcloud#index'

  # end

    get 'upload' => 'upload#index', :as => 'upload'
    post 'upload' => 'upload#index'

    get 'upload/mixcloud' => 'upload#mixcloud', :as => 'mixcloud'
    post 'upload/mixcloud' => 'upload#mixcloud', :as => 'mixcloud_post'

    get 'upload/soundcloud' => 'upload#soundcloud', :as => 'soundcloud'
    post 'upload/soundcloud' => 'upload#soundcloud', :as => 'soundcloud_post'

  resources :designs

  resources :mashtags

  get 'mashtags/:id/embed' => 'mashtags#embed'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'canvas#index'

  post 'canvas' => 'canvas#index'
  get 'canvas' => 'canvas#index'

  get 'preferences' => 'canvas#preferences'
  get 'canvas/connect' => 'canvas#connect'

  get 'designs/:id/json' => 'designs#show', :defaults => { :format => 'json' }, :as => :json

  post 'facebook_page_tab' => 'facebook_page_tabs#create', :as => 'new_fb_page_tab'

  get 'mixcloud/search' => 'mixcloud#search'
  post 'mixcloud/search' => 'mixcloud#search', :as => 'search'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
