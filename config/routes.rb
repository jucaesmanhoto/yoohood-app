Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  get '/members', to: 'pages#members'
  get '/profile', to: 'pages#profile'

  get 'fb/events', to: 'facebook_events#index'
  get 'fb/token', to: 'facebook_events#new'
  post 'fb/events', to: 'facebook_events#create'
  post 'fb/pull', to: 'facebook_events#pull_fb_events'

  get 'my_events', to: 'events#my_events'
  resources :places

  resources :trades, only: %i[index show]
  resources :benefits, only: %i[index edit destroy] do
    resources :trades, only: %i[new create]
  end
  resources :events do
    resources :event_categories, only: %i[create update]
    resources :invites, only: [:create]
    post 'guest', to: 'invites#guest'
    resources :benefits, only: %i[show new create update]
  end

  resources :event_categories, only: :destroy
end
