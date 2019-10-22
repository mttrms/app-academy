Rails.application.routes.draw do
  root "pages#show", page: "home"
  resources :users, only: [:new, :create, :show]
  resources :goals, only: [:show, :new, :create, :edit, :update, :destroy]
  resource :session, only: [:new, :create, :destroy]
end
