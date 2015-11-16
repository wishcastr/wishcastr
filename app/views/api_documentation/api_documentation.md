# Wishcastr API Documentation:


### GET /products/trigger_update.json
update trigger for products

### Response:
```javascript
{
  "status": "Success!"
}  
```

### GET /wishes/draft.json?access_token&user_id=[#{user_id}]
returns a single draft wish

### Response
```javascript
{
  "id": 2,
  "user_id": 1,
  "threshold_price": 49.99,
  "category": "Viedo Games",
  "query": "XBOX One",
  "name": "Black Ops",
  "saved": false,
  "created_at": "2015-11-13T20:47:13.979Z",
  "updated_at": "2015-11-13T20:47:13.979Z",
  "products": []
}
```

### POST /wishes/draft.json?access_token=#{user.access_token}&user_id=[#{user.id}]
returns a draft add wishes action

### Request
```javascript
{
  "id": 2,
  "user_id": 1,
  "threshold_price": 25,
  "category": "Animals",
  "query": "Dogs",
  "name": "Bull-Dog",
  "saved": false,
  "created_at": "2015-11-13T20:47:13.979Z",
  "updated_at": "2015-11-13T20:47:13.979Z",
  "products": []
}
```

### Response
If authentication is not  given
```javascript
{"error":"not authorized"}
```

### GET /price_histories/1.json
returns a single price history

### Response
```javascript
{
  "id": 1,
  "product_id": 35,
  "currency": null,
  "price": "10000.0",
  "date": "2015-11-11T21:30:31.815Z",
  "created_at": "2015-11-12T21:30:31.822Z",
  "updated_at": "2015-11-12T21:30:31.822Z"
}
```
### GET /price_histories.json
returns all price histories

### Response
```javascript
[
  {
    "id": 1,
    "product_id": 35,
    "currency": null,
    "price": "10000.0",
    "date": "2015-11-11T21:30:31.815Z",
  },
  {
    "id": 2,
    "product_id": 1,
    "currency": null,
    "price": "12.33",
    "date": "2015-11-12T21:30:55.652Z",
  }
]
```
