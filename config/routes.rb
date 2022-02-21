Rails.application.routes.draw do
  get 'users/whishlist'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  get 'rentals/index'
  get 'rentals/show'
  get 'rentals/new'
  get 'rentals/create'
  get 'rentals/edit'
  get 'rentals/update'
  get 'rentals/destroy'
  get 'offers/index'
  get 'offers/show'
  get 'offers/new'
  get 'offers/create'
  get 'offers/edit'
  get 'offers/update'
  get 'offers/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
