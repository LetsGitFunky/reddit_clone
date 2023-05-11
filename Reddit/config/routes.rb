Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: [:new, :create, :show] do
    resources :subs, only: [:new, :create, :update, :edit, :destroy ]
  end

  resources :subs, only: [:show, :index]

  resource :session, only: [:new, :create, :destroy]
end
