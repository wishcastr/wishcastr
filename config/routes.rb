Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "static#index"

  post 'login/amazon' => 'users#amazon_login'
  resources :users
  resources :wishes
  resources :price_histories
  resources :products_wishes
  resources :products do
    collection do
      get 'top'
      get 'search'
    end
  end

  mount ApiDocs::Engine => '/api-docs'

end
