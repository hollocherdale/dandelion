Dandelion::Application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  resources :chapters do
    member do
      match :upvote,   via: [:post, :delete]
      match :downvote, via: [:post, :delete]
    end
    post 'create_seed',  on: :new
    get 'seed', on: :new
  end

  resources :uploads, :only => [:create, :destroy]
  resources :books

  root 'books#home'
  match '/chapters/:id',    to: 'chapters#show',    via: 'get'
  match '/about',           to: 'chapters#about',   via: 'get'
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
end
