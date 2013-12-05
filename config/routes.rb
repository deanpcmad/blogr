Blogr::Engine.routes.draw do

  resources :posts do
    collection do
      post :preview
    end
  end
  resources :categories
  resources :tags
  resources :users, except: [:show]
  resources :comments

  get "login" => "sessions#new"
  get "logout" => "sessions#destroy"
  resources :sessions, only: [:index, :create]

  root to: "dashboard#index"

end