Blogr::Engine.routes.draw do

	root to: "dashboard#index"

  resources :posts
  resources :categories

end