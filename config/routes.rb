Rails.application.routes.draw do
  get 'users/whishlist'
  resources :users
  resources :rentals, except: %i[new]
  get '/offers/:id/rent', to: 'rentals#new'
  resources :offers
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :offers
end
