require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq", constraints: Trestle::Auth::Constraint.new
  
  resources :movies
  resources :musics
  resources :forms
  resources :sharks do
    resources :posts
  end
  get 'endangered/index'
  get "/sidekiq", to: redirect("login", status: 302)
  get 'endangered/index'
  get 'endangered/data', to: 'endangered#data'
  post 'endangered/upload', to: 'endangered#upload'
  post 'endangered/destroy', to: 'endangered#destroy'
  get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
