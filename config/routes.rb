Rails.application.routes.draw do
  get 'users/wishlist', to: 'users#wishlist'
  resources :rentals, except: %i[new]
  resources :offers
  devise_for :users
  get 'dashboard', to: 'pages#dashboard'
  root to: 'pages#home'
end
