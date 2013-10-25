Simpleblog::Engine.routes.draw do

	root to: "home#index"

  resources :posts, path: "", only: :show
  resources :categories

  namespace :admin do
  	resources :categories
  	resources :posts
  end

end