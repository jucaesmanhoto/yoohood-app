Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/members', to: 'pages#members'
  get '/profile', to: 'pages#profile'

  get 'fb/events', to: 'facebook_events#index'
  post 'fb/events', to: 'facebook_events#create'

  get 'dashboard', to: 'dashboards#new'
  post 'dashboard', to: 'dashboards#create'

  resources :dashboards
  resources :places
  resources :events
end
