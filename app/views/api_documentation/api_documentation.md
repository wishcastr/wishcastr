API Documentation:

GET path localhost:3000




GET path /products/trigger_update.json
```javascript
{
  "status": "Success!"
}  
```
GET path /wishes/draft.json?access_token&user_id=1
```javascript
{
  "id": 2,
  "user_id": 1,
  "threshold_price": null,
  "category": null,
  "query": null,
  "name": null,
  "saved": false,
  "created_at": "2015-11-13T20:47:13.979Z",
  "updated_at": "2015-11-13T20:47:13.979Z",
  "products": []
}
```
POST path /wishes/draft.json?access_token&user_id=1
```javascript
{
  "error": "not authorized"
}
```



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
