Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/members', to: 'pages#members'
  get '/profile', to: 'pages#profile'

  get 'fb/events', to: 'facebook_events#index'
  post 'fb/events', to: 'facebook_events#create'
  post 'fb/pull', to: 'facebook_events#pull_fb_events'
  get 'fb/token', to: 'facebook_events#new'

  resources :dashboards
  resources :places
  resources :benefits, only: %i[index edit update destroy]
  resources :events do
    resources :invites, only: %i[create show]
    resources :benefits, only: %i[show new create]
  end
end
