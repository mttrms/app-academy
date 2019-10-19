Rails.application.routes.draw do
  root "pages#show", page: "home"
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
end
