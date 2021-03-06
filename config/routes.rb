Rails.application.routes.draw do
  resources :clients
  resources :searches
  resources :projects do 
    collection { post :import }
  end
  
  resources :helps
  get 'admin', to: 'pages#admin'
  get 'help', to: 'pages#help'
  get 'contact', to: 'pages#contact'
  get 'manage_users', to: 'pages#manage_users'
  

  resources :profiles 

  devise_for :users,
    :controllers => {
      :sessions => "sessions"
    }
  
  # manage admin status
  get 'make_admin/:id', to: 'users#make_admin'
  get 'make_super_admin/:id', to: 'users#make_super_admin'
  get 'remove_roles/:id', to: 'users#remove_roles'
  delete 'delete_all', to: 'projects#delete_all'
  
  get 'add_client', to: 'pages#add_client'
  get 'remove_client', to: 'pages#remove_client'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  resources :users, only: :destroy do
    patch 'assign_clients', to: 'users#assign_clients', as: 'assign_clients'
  end
  
  get 'home/index'

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
