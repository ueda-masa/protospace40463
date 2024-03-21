Rails.application.routes.draw do
  devise_for :users
  get 'articles/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root to: "articles#index"
   resources :prototypes, only: [:index, :new, :create, :show]
end
