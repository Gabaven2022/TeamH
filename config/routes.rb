Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'}
  resources :users do
    member do
      get :follows, :followers
      get 'edit_image'
      get 'user_point'
      patch 'add_image'
    end
    resource :relationships, only: [:create, :destroy]
  end
  root to: "texts#home"
  resources :posts do
    resources :likes
  end
  resources :messages
  resources :rooms
  resources :comments
  resources :texts do
    member do
      get 'date'
      get 'text_index'
      get 'text_buy'
      get 'confirm'
      post 'date_create'
      delete 'date_destroy'
    end
    collection do
      get :home
      get :faculty
    end
  end
  resources :notifications
end
