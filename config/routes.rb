Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'}
  resources :users do
    member do
      get :follows, :followers
      get 'edit_image'
      patch 'add_image'
    end
    resource :relationships, only: [:create, :destroy]
  end
  root to: "posts#index"
  resources :posts do
    resources :likes
  end
  resources :messages
  resources :rooms
  resources :comments
  resources :texts do
    member do
      get 'place'
      get 'text_index'
      get 'text_buy'
      post 'place_create'
    end
    collection do
      get :home
      get :faculty
    end
  end
end
