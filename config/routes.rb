Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "static#index"
  get 'products/trigger_update' => 'products#trigger_update'
  post 'login/amazon' => 'users#login_amazon'
  post 'wishes/draft' => 'wishes#draft_wish_add'
  get 'wishes/draft' => 'wishes#draft'

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

end
