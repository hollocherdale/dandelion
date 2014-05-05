Dandelion::Application.routes.draw do
  devise_for :users

  resources :adventures#, :only => [:create, :show, :new, :index, :update]
  resources :posts, :only => [:edit, :update]

  root 'adventures#home'

  match '/adventures/:id',  to: 'adventures#show',    via: 'get'
  match '/about',           to: 'adventures#about',   via: 'get'

end