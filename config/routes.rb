Rails.application.routes.draw do
  devise_for :users,
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  scope '(:locale)', locale: /br/ do
    root to: 'pages#home'
    get '/members', to: 'pages#members'
    get '/profile', to: 'pages#profile'
    get '/about', to: 'pages#about'
    # get '/contact', to: 'pages#contact'

    get 'fb/events', to: 'facebook_events#index'
    get 'fb/token', to: 'facebook_events#new'
    post 'fb/events', to: 'facebook_events#create'
    post 'fb/pull', to: 'facebook_events#pull_fb_events'

    get 'my_events', to: 'events#my_events'
    post 'nearby', to: 'events#nearby'
    # get 'invite', to: 'invites#invitation'
    get '/invite/:id/:token', to: 'invites#show_if_logged', as: 'logged_invite'
    resources :benefits, only: %i[index edit destroy] do
      resources :trades, only: %i[new create]
    end
    resources :chat_rooms, only: %i[show] do
      resources :messages, only: %i[create]
    end
    resources :contacts, only: %i[new create]
    resources :events do
      # get '/require', to: 'events#ask_for_ownership'
      # post '/require', to: 'events#make_it_mine'
      resources :event_categories, only: %i[create update]
      resources :invites, only: %i[create]
      # get 'invites', to: 'invites#create'
      post 'generate_link', to: 'invites#generate'
      resources :benefits, only: %i[show new create update]
      resources :checkins, only: %i[new create]
    end
    resources :event_categories, only: :destroy
    resources :invites, only: %i[show update]
    resources :places
    resources :trades, only: %i[index show]
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :events , only: %i[index  show]
    end
  end
end
