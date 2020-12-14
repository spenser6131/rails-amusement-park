Rails.application.routes.draw do

  root 'static#home'
  resources :users
  resources :rides
  resources :attractions
  get "/signin", to: "sessions#new", as: "signin"
  post "/signin", to: "sessions#create"
  delete "/signout", to: "sessions#delete", as: "signout"
  post "/rides", to: "rides#create", as: "go_on_ride"

end