Rails.application.routes.draw do
  namespace :api do
    resources :todos,
      only: [:show, :index, :create, :update, :destroy],
      defaults: { format: :json }
  end
end
