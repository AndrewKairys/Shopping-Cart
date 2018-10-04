Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'registrations'
  }

  resources :users do
    resources :products, controller: 'user'
  end
  resources :categories, only: [:index] do 
    resources :products 
  end
  resources :order_items
  resources :carts

  
  root 'categories#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
