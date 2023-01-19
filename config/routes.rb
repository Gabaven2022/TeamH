Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'},
    path_names: {
      sign_in: 'sign_in',
      sign_out: 'sign_out',
      sign_up: 'sign_up'
    }
  resources :users do
    member do
      get :follows, :followers
      get 'edit_image'
      patch 'add_image'
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
      get 'text_buy'
      post 'place_create'
    end
    collection do
      get :home
      get :faculty
    end
  end
end
