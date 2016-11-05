Rails.application.routes.draw do
  get 'manager/login'

  mount WeixinRailsMiddleware::Engine, at: "/"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # get 'products/:id' => 'catalog#view'
  get 'welcome/show'
  get 'welcome/index'
  get "welcome/navigate"

  get 'manager/login'
  get 'manager/loginCheck'

  # 页面跳转到店员页面
  get 'dianyuan/dianyuanInfo'
  get 'dianyuan/dianyuanCharts'

  get "dianyuan/downloadQrcode"

  # 同步所有的店员信息到表中去
  get 'dianyuan/synchronizeDianyuan'



  get 'membership/index'  #会员信息的初始页面
  get 'membership/sendsms'
  get 'membership/opencardsubmit'
  get 'membership/redirect'

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
