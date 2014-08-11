Dandelion::Application.routes.draw do
  devise_for :users

  root 'adventure_collections#home'

  resources :adventures do
    member do
      match :upvote, via: [:post, :delete]
      match :downvote, via: [:post, :delete]
    end
    get 'seed', on: :new
  end

  resources :uploads, :only => [:create, :destroy]
  resources :adventure_collections

  match 'about',           to: 'adventures#about',   via: 'get'
end
