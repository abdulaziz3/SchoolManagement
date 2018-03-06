Rails.application.routes.draw do

  # resources :messages
  resources :lessons
  resources :courses
  resources :student_attendances
  resources :attendance_descriptions
  resources :student_homeworks
  resources :parents
  resources :homeworks
  resources :marks
  resources :roles
  resources :student_subjects
  resources :users
  resources :grades
  resources :marks
  resources :subjects
  resources :students

  # Sessions Log in - Log out // user && studends
  controller :sessions do
		get 'student_login' => :new
		post 'student_login' => :create
		get 'student_logout' => :destroy
		delete 'student_logout' => :destroy

    get 'user_login' => :usernew
    post 'user_login' => :usercreate
    get 'user_logout' => :userdestroy
    delete 'user_logout' => :userdestroy

    get 'parent_login' => :parentnew
    post 'parent_login' => :parentcreate
    get 'parent_logout' => :parentdestroy
    delete 'parent_logout' => :parentdestroy
	end

  get 'search' => 'users#search'
  get 'searchAttendance' => 'student_attendances#searchAttendance'
  # get 'searchAttenanceDate' => 'student_attendances#searchAttendanceDate'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get 'pages/home'
  get 'pages/about'
  get 'pages/faqs'

  #post 'attendances/saveAttendance'
  #get 'student_attendances/new/:gradeValue'
  post 'student_attendances/saveAttendance'
  post 'marks/saveMarks'


  # You can have the root of your site routed with "root"
  root :to => "pages#home"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  # conversations
      resources :conversations do
        member do
          post :reply
          post :trash
          post :untrash
        end
      end
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
