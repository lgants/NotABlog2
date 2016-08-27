Rails.application.routes.draw do
  resources :comments
  resources :votes
  resources :users
  resources :posts
  # resources :sessions, except: [:destroy]
  # delete "/signout", to: "sessions#destroy", as: "signout"
  #resource :sessions, only: [:new, :show, :create, :destroy]
  resources :sessions

  root 'welcome#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
