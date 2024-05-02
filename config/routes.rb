Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/create'
  resources :users, only: [:new, :create]
   resources :sessions, only: [:new, :create, :destroy]
  
  # config/routes.rb
resources :expenses, only: [:index, :new, :create, :edit, :update, :destroy,:show],defaults: { format: 'json' }
resources :expense_categories, only: [:index, :new, :create, :edit, :update, :destroy,:show],defaults: { format: 'json' }
resources :admins, only: [:index, :new, :create, :edit, :update, :destroy,:show],defaults: { format: 'json' }

  root 'sessions#new'

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/new'
  get 'users/create'
  get 'dashboard/index'
 get 'expense/new'
  get 'expense/edit'
  get 'expensecategory/new'
  get 'expensecategory/edit'
    get 'admin/new'
  get 'admin/edit'
  get '/login', to: 'sessions#new'
   get '/dashboard', to: 'dashboard#index'
   
  post '/login', to: 'sessions#create'
  
  get '/signup', to: 'users#new'  # Add route for user registration
  post '/signup', to: 'users#create'
  get '/profile', to: 'users#profile' # Example route
  get '/expensecategory', to: 'users#expensecategory' # Example route
  get '/adminpath', to: 'users#admin' # Example route

get '/expensepath', to: 'users#expense'

get '/new_expense', to: 'expenses#new', as: 'new_expense_form'
post '/create_expense_action', to: 'expenses#create', as: 'create_expense_action'
patch '/update_expense_action/:id', to: 'expenses#update', as: 'update_expense_action'
delete '/delete_expense_action/:id', to: 'expenses#destroy', as: 'delete_expense_action'

get '/expense_category', to: 'users#expensecategory', as: 'user_expensecategory'
get '/new_expense_category', to: 'expense_categories#new', as: 'new_expense_category_form'
post '/create_expense_category_action', to: 'expense_categories#create', as: 'create_expense_category_action'
patch '/update_expense_category_action/:id', to: 'expense_categories#update', as: 'update_expense_category_action'
delete '/delete_expense_category_action/:id', to: 'expense_categories#destroy', as: 'delete_expense_category_action'

get '/admin', to: 'users#admin', as: 'user_admin'
get '/new_admin', to: 'admins#new', as: 'new_admin_form'
post '/create_admin_action', to: 'admins#create', as: 'create_admin_action'
patch '/update_admin_action/:id', to: 'admins#update', as: 'update_admin_action'
delete '/delete_admin_action/:id', to: 'admins#destroy', as: 'delete_admin_action'

get '/forgot_password', to: 'password_resets#new', as: 'forgot_password'

# Route to handle form submission and send password reset email
post '/forgot_password_send', to: 'password_resets#create'
  delete '/signout', to: 'sessions#destroy'

  
resources :users do
    post 'send_password_reset_email', on: :collection
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
