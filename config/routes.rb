Rails.application.routes.draw do
  devise_for :users

  resources :samples
  resources :songs

  root to: "samples#index"
end
