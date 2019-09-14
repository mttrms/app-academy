Rails.application.routes.draw do
  resources :cats do
    resources :toys
  end
  # resources :toys
end
