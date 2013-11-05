Blogr::Engine.routes.draw do

  resources :posts
  resources :categories

  root to: "dashboard#index"

end