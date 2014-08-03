Socialist::Application.routes.draw do
  get "profiles/show"

  devise_for :users
  devise_scope :user do
    get "register", to: "devise/registrations#new", as: :register
    get "login", to: "devise/sessions#new", as: :login
    get "logout", to: "devise/sessions#destroy", as: :logout
  end

  resources :statuses
  get "updates", to: "statuses#index", as: :updates

  get "/:id", to: "profiles#show", as: :profile

  root to: "statuses#index"
end
