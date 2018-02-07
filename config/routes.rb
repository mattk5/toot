Rails.application.routes.draw do
  root 'toots#index'
  get '/sign_up', to: 'users#new'
  # get '/log_in', to: 'sessions#new'
  resources :toots
  resources :users, except: :new
end
