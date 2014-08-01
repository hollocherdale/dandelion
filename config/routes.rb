Dandelion::Application.routes.draw do
  devise_for :users

  resources :adventures do
    member do
      match :upvote, via: [:post, :delete]
      match :downvote, via: [:post, :delete]
    end
  end

  resources :uploads, :only => [:create, :destroy]

  root 'adventures#home'
  match '/adventures/:id',  to: 'adventures#show',    via: 'get'
  match '/about',           to: 'adventures#about',   via: 'get'
end
