Rails.application.routes.draw do
  devise_for :users, controllers: {
    # sessions: 'user/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
    # registrations: 'user/registrations'
  }

  root to: 'pages#home'
  get '/members', to: 'pages#members'
  get '/profile', to: 'pages#profile'

  get 'fb/events', to: 'facebook_events#index'
  post 'fb/events', to: 'facebook_events#create'
  get 'fb/token', to: 'facebook_events#new'

  resources :places
  resources :benefits, only: %i[index edit destroy]
  resources :events do

    resources :invites, only: [:create]
    post 'guest', to: 'invites#guest'
    resources :benefits, only: %i[show new create update]
  end
end
