Blogr::Engine.routes.draw do

  resources :posts
  resources :categories
  resources :tags
  resources :users, except: [:show]

  get "login" => "sessions#new"
  get "logout" => "sessions#destroy"
  resources :sessions, only: [:index, :create]

  root to: "dashboard#index"

end