Rails.application.routes.draw do
  # mount Rswag::Ui::Engine => '/api-docs'
  # mount Rswag::Api::Engine => '/api-docs'
  post 'api/v1/create/:username/:email', to: 'users#create'
  get 'api/v1/login/:username', to: 'users#login'
  # get 'api/v1/users/flight/:id', to: 'users#user_flight'
  # get 'splash', to: 'users#flight'
  get 'users/:id', to: 'users#index'
  namespace :api do
    namespace :v1 do
      get 'reservations/:user_id', to: 'reservations#index'
      post 'reservations/:user_id', to: 'reservations#create'
      get 'api/v1/flight/:id', to: 'flights#show'
      delete 'api/v1/flights/:id', to: 'flights#delete'
      resources :flights, only: %i[index show create destroy] 
      resources :users do
        resources :reservations, only: %i[index show]
      end
    end
  end
end
