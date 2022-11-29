Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :sports, only: [:index, :new, :create]
  resources :products do
    resources :bookings, only: [:new, :create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :bookings, only: [:index, :show]
  # Defines the root path route ("/")
  # root "articles#index"
end
