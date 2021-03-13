require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: [:index, :create, :destroy]
  get '/unsubscribe', to: 'users#unsubscribe'
  mount Sidekiq::Web => '/sidekiq'
end
