Dandelion::Application.routes.draw do
  devise_for :users

  resources :adventures
  resources :posts
end
