Simpleblog::Engine.routes.draw do
  resources :categories

  resources :posts

  root to: "home#index"
end
