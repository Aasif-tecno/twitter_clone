Rails.application.routes.draw do
  
  root 'pages#index'
  get '/about', to: 'pages#about'
  devise_for :users
  resources :tweeets

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
