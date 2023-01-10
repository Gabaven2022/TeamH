Rails.application.routes.draw do
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
end
