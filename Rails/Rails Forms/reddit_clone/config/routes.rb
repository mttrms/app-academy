Rails.application.routes.draw do
  resources :users
  resources :subs, except: [:destroy]
  resources :posts, except: [:index]
  resource :session, only: [:new, :create, :destroy]
end
