Rails.application.routes.draw do
  
  root 'pages#index'
  get 'user/:id', to: 'pages#dashboard', as: 'user'
  get '/search', to: 'pages#search', as: 'search'
  post '/user/:id/follow', to: "follows#follow", as: "follow_user"
  post '/user/:id/unfollow', to: "follows#unfollow", as: "unfollow_user"
  devise_for :users
  delete 'tweeets/:tweeet_id/comment/:id', to: 'comments#destroy', as: "destroy_comment"
  resources :tweeets do
    resources :comments
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
