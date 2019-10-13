Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]
  
  resources :bands do
    resources :albums, only: [:new]
  end

  resources :albums, only: [:create, :edit, :update, :destroy, :show] do
    resources :tracks, only: [:new]
  end

  resources :tracks, only: [:create, :edit, :update, :destroy, :show]

  resources :notes, only: [:create, :destroy]
  
  resource :session, only: [:new, :create, :destroy]
end
