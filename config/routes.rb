Rails.application.routes.draw do
  root 'toots#index'
  resources :toots do
    resources :comments
  end
  resources :users do
    resources :comments
  end
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships 
  get '/sign_up', to: 'users#new'
  get '/log_in', to: 'sessions#new'
  post '/log_in', to: 'sessions#create'
  delete '/log_out', to: 'sessions#destroy'
end
