Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:index, :show, :edit, :update, :destroy]
  root "home#index"
  get "home/about" => "home#about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
