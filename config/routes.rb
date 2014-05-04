Mmr2::Application.routes.draw do
  root to: 'home#index'

  resources :routes

  resources :locations

  resources :trips

  devise_for :users

  get '/rails/routes', to: redirect('/rails/info/routes')
end
