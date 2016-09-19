Rails.application.routes.draw do
  devise_for :admins
  root "admin#redir_dash"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  scope 'admin' do
    get 'dashboard' => 'admin#index'
    get 'wifi_detail' => 'admin#wifi_table'
    get 'wifi_map' => 'admin#wifi_map'
    get 'users' => 'admin#users'
    get 'connections' => 'admin#connections'
    get 'earnings' => 'admin#payments'
    get 'block' => 'admin#block'
    get 'statistics' => 'admin#stats'
    get 'stripe' => 'admin#stripe_account_list'
    get 'defaulter' => 'admin#term_success_false'
    get 'stripe/refund/:ch_tok' => 'admin#stripe_account_refund' , as: 'refund_stripe'

    get 'defaulter/success/:id' => 'admin#term_success_mark_true' , as: 'successfully_terminated_true'

    get 'block_user/:id' => 'admin#block_user' , as: 'block_user'
    get 'unblock_user/:id' => 'admin#unblock_user' , as: 'unblock_user'

    get 'block_wifi/:id' => 'admin#block_wifi' , as: 'block_wifi'
    get 'unblock_wifi/:id' => 'admin#unblock_wifi' , as: 'unblock_wifi'

    post 'rest_pass/:id' => 'admin#reset_pass' , as: 'reset_password_admin'
  end
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
