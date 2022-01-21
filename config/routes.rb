Rails.application.routes.draw do
  get 'comments/create'
  get 'comment/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root 'users#index'
  resources :users, only: %i[index show] do
    resources :posts do
      resources :comments, only: %i[create]
      resources :likes, only: %i[create]
    end
  end
end
