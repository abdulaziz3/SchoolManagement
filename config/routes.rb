Rails.application.routes.draw do


  resources :student_parents
  # resources :messages
  resources :lessons
  resources :courses
  resources :student_attendances
  resources :attendance_descriptions
  resources :student_homeworks
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

  ####### CHARTS
  namespace :charts do
    get 'chart-attendance'
    get 'chart_student_grades'
    get 'chart_user_roles'
    get 'chart_student_marke_grades'
  end

  get 'search' => 'users#search'
  get 'searchAttendance' => 'student_attendances#searchAttendance'

  namespace :pages do
    get 'home'
    get 'about'
    get 'faqs'
  end

## marks and attendance
  post 'student_attendances/saveAttendance'
  post 'marks/saveMarks'

##Home root
  root :to => "pages#home"

##Mailboxer routes
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

end
