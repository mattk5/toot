Rails.application.routes.draw do
  root 'toots#index'
  resources :toots
  resources :users 
end
