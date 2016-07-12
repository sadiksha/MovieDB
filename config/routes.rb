Rails.application.routes.draw do
  devise_for :users
  root 'movies#index'

  resources :movies

  resources :ratings, only: [:create, :show, :update]
end
