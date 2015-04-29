Rails.application.routes.draw do

  resources :users, only: [:new, :create]

  root to: 'authors#index'

  get '/authors', to: 'authors#index'
  get '/authors/:id', to: 'authors#show'
  get '/authors/:id/todos', to: 'todos#index'

  post '/authors', to: 'authors#create'
  post '/authors/:id/todos', to: 'todos#create'

  get 'sessions/new', to: 'sessions#new'
  post 'sessions', to: 'sessions#create'
  delete 'sessions', to: 'sessions#destroy'
end
