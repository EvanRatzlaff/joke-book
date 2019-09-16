Rails.application.routes.draw do
  root  'home#index'
  get '/auth/facebook/callback' => 'sessions#create'
  
  get '/signup', to: "users#new", as: "signup" #<- signup_path
  post '/signup', to: "users#create"

  get '/login', to: "sessions#new", as: "login" #<- login_path
  post '/login', to: "sessions#create"
  
  get '/profile', to: "users#show", as: "profile" #<- profile_path
  
  resources :sessions
  delete '/logout', to: 'sessions#destroy', as: 'logout' #<- logout_path

  resources :users do
    resources :jokes
    resources :rooms
    resources :likes
  end
  resources :rooms
  resources :jokes
 
  resources :jokes do
    resources :comments
  end

  resources :jokes do
    resources :likes
  end

  resources :users do 
    resources :comments, :except => [ :destroy]
  end
  resources :comments, :only => [:update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
