Rails.application.routes.draw do

  root 'categories#index'
  
  devise_for :users, controllers: {
    registrations: 'registrations',
    omniauth_callbacks: 'omniauth_callbacks'
  }

  get 'products_by_price', :to => 'products#products_by_price'
  resources :users do
    resources :products
  end
  resources :categories, only: [:index] do 
    resources :products 
  end
  resources :order_items
  resources :carts

  
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
