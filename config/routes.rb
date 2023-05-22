Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :tokens, only: [:create]
      resources :users, only: %i[show create update destroy]
      resources :restaurants do
        resources :tables
        resources :reservations
      end
    end
  end
end
