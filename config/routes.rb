Rails.application.routes.draw do
  resources :orders
  resources :line_items do
    put :decrement, on: :member
  end
  resources :carts
  root 'store#index', as: 'store_index'
  get 'store/index'
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
