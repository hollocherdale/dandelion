Dandelion::Application.routes.draw do
  devise_for :users

  resources :adventures do
    member do
      put "like",    to: "adventures#upvote"
      put "dislike", to: "adventures#downvote"
    end
  end

  resources :uploads, :only => [:create, :destroy]

  root 'adventures#home'
  match '/adventures/:id',  to: 'adventures#show',    via: 'get'
  match '/about',           to: 'adventures#about',   via: 'get'	

end