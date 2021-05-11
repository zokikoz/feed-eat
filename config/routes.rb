Rails.application.routes.draw do
  root 'items#index'

  resources :items, only: [:index, :show]
  resources :channels, only: [:index, :new, :create, :destroy]

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
