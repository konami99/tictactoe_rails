require 'sidekiq/web'

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  mount Sidekiq::Web => '/sidekiq'

  # Defines the root path route ("/")
  # root "articles#index"

  post '/tictactoeboards/click', to: 'tictactoeboards#click'
  post '/tictactoeboards/reset', to: 'tictactoeboards#reset'
  post '/tictactoeboards/leave', to: 'tictactoeboards#leave'
  get '/tictactoeboards/index', to: 'tictactoeboards#index'
  get '/tictactoeboards/join', to: 'tictactoeboards#join'
  post '/tictactoeboards/join_team', to: 'tictactoeboards#join_team'
  # root "tictactoeboards#index"
  root "rails/welcome#index"
end
