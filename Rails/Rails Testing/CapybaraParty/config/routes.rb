Rails.application.routes.draw do
  resources :capys, only: [:new, :create, :show, :index] do
    resources :parties, only: [:new, :create]
  end

  resources :parties, only: [:show]

  root to: 'capys#index'
end
