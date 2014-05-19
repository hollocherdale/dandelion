Dandelion::Application.routes.draw do
  devise_for :users

  resources :adventures
  resources :votes, :only => [:create, :destroy]
  resources :photos, :only => [:create, :destroy]

  root 'adventures#home'

  match '/adventures/:id',  to: 'adventures#show',    via: 'get'
  match '/about',           to: 'adventures#about',   via: 'get'	

end