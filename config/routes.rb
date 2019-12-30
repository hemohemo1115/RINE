Rails.application.routes.draw do
  get 'rooms/show'
  root 'rooms#index'
  get 'sessions/new'
  get '/create(/:id)', to: 'rooms#create'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :rooms, only: %i[show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
