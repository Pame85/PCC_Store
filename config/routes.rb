Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'sessions'}
  resources :products
  resources :orders, only: [:new, :create, :show]

  resource :shopping_cart
  
  root to: "home#index"
end


# index
# show
# new
# create
# edit
# update
# destroy