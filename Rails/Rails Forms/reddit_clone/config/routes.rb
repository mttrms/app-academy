Rails.application.routes.draw do
  resources :users
  resources :subs, except: [:destroy]
  resource :session, only: [:new, :create, :destroy]
end
