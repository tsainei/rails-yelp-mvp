Rails.application.routes.draw do
  root 'restaurants#index'

  resources :restaurants do
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
