Rails.application.routes.draw do
  get 'users/whishlist'
  resources :rentals, except: %i[new]
  get '/offers/:id/rent', to: 'rentals#new', as: :new_rental
  resources :offers
  devise_for :users
  get '/users/:id', to: 'users#show', as: :user
  root to: 'pages#home'
end
