Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users
  resources :users
  resources :rooms
  post 'reserves/new', to: 'reserves#new'
  post 'reserves/create', to: 'reserves#create'
  resources :reserves
  get "search" => "searches#search"
end
