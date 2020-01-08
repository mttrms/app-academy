Rails.application.routes.draw do
  root to: 'static_pages#root'

  namespace :api do
    resources :todos,
      only: [:show, :index, :create, :update, :destroy],
      defaults: { format: :json }
  end
end
