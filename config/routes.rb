Rails.application.routes.draw do
  root 'restaurants#index'

  resources :restaurants, only: %i[index show new create] do
    resources :reviews, only: [:create]
  end

  resources :reviews, only: %i[destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
