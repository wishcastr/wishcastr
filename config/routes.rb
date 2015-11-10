Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "static#index"

  post 'login/amazon' => 'users#login_amazon'
  post 'wishes/draft_wish_add'
  get 'wishes/draft'

  resources :users, defaults: { format: 'json' }
  resources :wishes, defaults: { format: 'json' }
  resources :price_histories, defaults: { format: 'json' }
  resources :products_wishes, defaults: { format: 'json' }
  resources :products, defaults: { format: 'json' } do
    collection do
      get 'top'
      get 'search'
    end
  end

  mount ApiDocs::Engine => '/api-docs'

end
