Rails.application.routes.draw do
  root 'pages#home'
  #get localhost:3000/'......', to: 'controller#function_in_controller'
  get 'about', to: 'pages#about'
  
  resources :articles
  
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
end
