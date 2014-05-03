Mmr2::Application.routes.draw do
  root to: 'home#index'

  resources :routes

  resources :locations

  resources :trips

  devise_for :users
end
