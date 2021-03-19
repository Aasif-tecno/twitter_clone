Rails.application.routes.draw do
  
  root 'pages#index'
  get 'user/:id', to: 'pages#dashboard', as: 'user'
  get '/search', to: 'pages#search', as: 'search'
  devise_for :users
  resources :tweeets

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
