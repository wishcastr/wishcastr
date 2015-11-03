Rails.application.routes.draw do

  resources :users
  resources :wishes
  resources :price_histories
  resources :products do
    collection do
      get 'top'
    end
  end
  mount ApiDocs::Engine => '/api-docs'

  resources :products_wishes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "static#index"

end
