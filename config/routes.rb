Rails.application.routes.draw do
  root  'home#index'
  get '/auth/facebook/callback', to: 'sessions#create'
  get '/login', to: "sessions#login", as: "login"
  post '/login', to: "sessions#post_login"
  
  get '/signup', to: "users#signup", as: "signup"
  post '/signup', to: "users#post_signup"

  get '/profile', to: "users#show", as: "profile"
  
  
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  
  resources :rooms
  resources :jokes

  resources :users do 
    resources :comments, :except => [:update, :destroy, :show, :new]
  end
  resources :comments, :only => [:update, :destroy]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
