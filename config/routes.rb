Rails.application.routes.draw do


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  resources :proposals

  get '/sozdanye_sajtov' => 'home#creating_site' #создание сайтов
  get '/sajt_pod_kljuch' => 'home#turnkey_site' #сайт под ключ
  get '/sozdat_sajt' => 'home#create_site' #создать сайт
  get '/sozdanye_sajta_s_nulja' => 'home#creating_scratch_site' #создание сайта с нуля
  get '/veb_studyja' => 'home#web_studio' #веб студия
  get '/zakazat_sajt' => 'home#order_site' #заказать сайт
  get '/sozdat_ynternet_magazyn' => 'home#create_shop' #создать интернет магазин
  get '/razrabotka_sajtov' => 'home#development_site' #разработка сайтов

  get 'zakazat_lending'  => 'home#order_landing_page' #заказать лендинг
  get 'razrabotka_sajtov_lendingov_veb_dizajn'  => 'home#development_site_landing_page_web_design' #разработка сайтов лендингов веб дизайн
  get 'zakazat_internet_magazin'  => 'home#order_shop' #заказать интернет магазин
  get 'zakazat_sajt_vizitku'  => 'home#order_card_site' #заказать сайт визитку

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
