Rails.application.routes.draw do
  resources :cats do
    # /cats/:cat_id/toys
    resources :toys, only: [:index]
  end
  # /toys/:id
  resources :toys, only: [:create, :show, :update, :destroy]
end
