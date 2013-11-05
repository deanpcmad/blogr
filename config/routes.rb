Blogr::Engine.routes.draw do

  resources :posts
  resources :categories
  resources :tags

  root to: "dashboard#index"

end