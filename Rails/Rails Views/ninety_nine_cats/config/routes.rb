Rails.application.routes.draw do
  resources :cats, only: [:index, :show, :new, :create, :edit, :update]
end
