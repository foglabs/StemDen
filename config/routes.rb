Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]

  resources :samples do
    resources :comments, only: [:new, :create, :destroy]
  end

  resources :topics do
    resources :comments, only: [:new, :create, :destroy]
  end

  resources :songs

  resources :song_samples, only: [:create]

  root to: "samples#index"
end
