Rails.application.routes.draw do
  resources :cats do
    # /cats/:cat_id/toys
    resources :toys, only: [:index, :new]
  end
  # /toys/:id
  resources :toys, only: [:create, :show, :update, :destroy]

  root to: redirect("/cats")
end
