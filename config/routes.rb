Rails.application.routes.draw do
  root 'toots#index'
  resources :toots, only: [:create]
  resources :users, except: :new
  get '/sign_up', to: 'users#new'
  get '/log_in', to: 'sessions#new'
  post '/log_in', to: 'sessions#create'
  delete '/log_out', to: 'sessions#destroy'
end
