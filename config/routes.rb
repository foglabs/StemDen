Rails.application.routes.draw do
  devise_for :users

  resources :users do
    collection do
      get '/dashboard' => 'users#dashboard'
    end
  end

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
