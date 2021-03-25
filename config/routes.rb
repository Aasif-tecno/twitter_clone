Rails.application.routes.draw do
  
  get 'likes/create'
  get 'likes/destroy'
  root 'pages#index'
  get 'user/:id', to: 'pages#dashboard', as: 'user'
  get '/search', to: 'pages#search', as: 'search'
  post '/user/:id/follow', to: "follows#follow", as: "follow_user"
  post '/user/:id/unfollow', to: "follows#unfollow", as: "unfollow_user"
  get '/user/:id/followers', to: "follows#followers", as: "user_followers"
  devise_for :users
  delete 'tweeets/:tweeet_id/comment/:id', to: 'comments#destroy', as: "destroy_comment"
  put 'tweeets/:id/like', to: 'likes#create', as: "like"
  delete 'tweeets/:id/unlike', to: 'likes#destroy', as: "unlike"
  resources :tweeets do
    resources :comments
  end 
  resources :conversations do
    resources :messages
    delete '/read', to: "messages#read"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
