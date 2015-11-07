Rails.application.routes.draw do

  resources :users, defaults: { format: 'json' }
  resources :wishes, defaults: { format: 'json' }
  resources :price_histories, defaults: { format: 'json' }
  resources :products, defaults: { format: 'json' } do
    collection do
      get 'top'
      get 'search'
    end
  end
  mount ApiDocs::Engine => '/api-docs'

  resources :products_wishes, defaults: { format: 'json' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "static#index"

end
