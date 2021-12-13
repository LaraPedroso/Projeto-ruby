Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :admins, controllers: { sessions: 'admins/sessions', registrations: 'admins/registrations' }
  root to: 'home#index'
  resources :categories
  resources :roles
  resources :posts
  resources :comments
  resources :admins
  resources :ratings

  get '/post/:id', to: 'home#post', as: 'home_post'
  post '/create/admin', to: 'admins#create', as: 'admin_create'
end