Rails.application.routes.draw do
  get 'users/whishlist'
  resources :rentals, except: %i[new]
  get '/offers/:id/rent', to: 'rentals#new'
  resources :offers
  devise_for :users
  get '/users/:id', to: 'users#show'
  root to: 'pages#home'
end
