Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'

  get '/prototypes/newest', to: 'prototypes#newest'
  resources :prototypes do
    resources :likes
    resources :comments
  end
  resources :users
end
