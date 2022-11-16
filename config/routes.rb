Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  root "api/v1/users#index"
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index]
      resources :reservations, only: [:create, :index]
      resources :flights, only: [:index, :show, :create, :destroy]
    end
  end
  post "/login", to: "users#login"
end
