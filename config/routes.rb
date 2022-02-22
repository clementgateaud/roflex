Rails.application.routes.draw do
  get 'users/whishlist'
  resources :rentals
  resources :offers
  devise_for :users
  get '/users/:id', to: 'users#show'
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :offers
end
