Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: [:index, :create]
  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  mount Sidekiq::Web => '/sidekiq'
end
