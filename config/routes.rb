Rails.application.routes.draw do
  devise_for :users

  resources :samples do
    resources :comments, only: [:new, :create, :destroy]
  end

  resources :songs

  root to: "samples#index"
end
