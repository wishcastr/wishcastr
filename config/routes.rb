Rails.application.routes.draw do

  get '/auth/amazon/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#failure'

  resources :users
  resources :wishes
  resources :price_histories
  resources :products do
    collection do
      get 'top'
      get 'search'
    end
  end
  mount ApiDocs::Engine => '/api-docs'

  resources :products_wishes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "static#index"

end
