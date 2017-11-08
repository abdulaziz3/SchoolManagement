Rails.application.routes.draw do

  resources :users
  resources :grades
  resources :marks
  resources :subject_teachers
  resources :subjects
  resources :students

  # Sessions Log in - Log out
  controller :sessions do
		get 'student_login' => :new
		post 'student_login' => :create
		get 'student_logout' => :destroy
		delete 'student_logout' => :destroy

    get 'user_login' => :usernew
    post 'user_login' => :usercreate
    get 'user_logout' => :userdestroy
    delete 'user_logout' => :userdestroy
	end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get 'pages/home'
  get 'pages/about'
  get 'pages/faqs'

  # You can have the root of your site routed with "root"
  root :to => "pages#home"

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
