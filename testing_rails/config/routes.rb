Rails.application.routes.draw do
  get "enemies/update"
  get "enemies/destroy"
  resources :users, only: [ :index, :create ]
  resources :weapons
end
