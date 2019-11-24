Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/members', to: 'pages#members'
  get '/profile', to: 'pages#profile'

  resources:
end
