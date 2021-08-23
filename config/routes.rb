Rails.application.routes.draw do
  devise_for :users
  root "profiles#new"
  resources :profiles
  # resources :profiles, only: [:new, :create, :show]
   # get '/register', to: 'users#new'
   # resources :users, except: [:new]

   # get 'login', to: 'sessions#new'
   # get 'logout', to: 'sessions#destroy'
   # post 'login', to: 'sessions#create' 
   
  resources :articles do
     resources :comments do 
      resources :replies
    end
  end
end
