Rails.application.routes.draw do
  devise_for :users

  resources :users do
    collection do
      get :dashboard
    end
  end

  resources :samples do
    resources :comments, only: [:new, :create, :destroy]
  end

  resources :topics do
    resources :comments, only: [:new, :create, :destroy]
  end

  resources :songs do
    collection do
      post :makemix
    end
  end

  resources :song_samples, only: [:create]

  root to: "samples#index"
end
