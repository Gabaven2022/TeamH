Rails.application.routes.draw do
  get 'texts/index'
  get 'texts/create'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users do
    member do
      get :follows, :followers
    end
    resource :relationships, only: [:create, :destroy]
  end
  root to: "posts#index"
  resources :posts
  resources :messages
  resources :rooms
  resources :comments
  resources :texts do
    member do
      get 'place'
      get 'text_index'
      post 'place_create'
    end
    collection do
      get :home
      get :faculty
    end
  end
end
