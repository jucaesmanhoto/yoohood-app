Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  get '/members', to: 'pages#members'
  get '/profile', to: 'pages#profile'

  get 'fb/events', to: 'facebook_events#index'
  post 'fb/events', to: 'facebook_events#create'
  # post 'fb/pull', to: 'facebook_events#pull_fb_events'
  get 'fb/token', to: 'facebook_events#new'

  resources :places
  resources :trades, only: %i[index show]
  resources :benefits, only: %i[index edit destroy] do
    resources :trades, only: %i[new create]
  end
  resources :events do
    resources :invites, only: [:create]
    post 'guest', to: 'invites#guest'
    resources :benefits, only: %i[show new create update]
  end
end
