Dandelion::Application.routes.draw do
  devise_for :users

  resources :chapters do
    member do
      match :upvote, via: [:post, :delete]
      match :downvote, via: [:post, :delete]
    end
  end

  resources :uploads, :only => [:create, :destroy]

  resources :books
  
  root 'books#home'
  match '/chapters/:id',  to: 'chapters#show',    via: 'get'
  match '/about',           to: 'chapters#about',   via: 'get'
end
