Rails.application.routes.draw do
  resources :channels
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
