# Wishcastr API Documentation:


### GET /products/trigger_update.json
update trigger for products

### Response:
```javascript
{
  "status": "Success!"
}  
```

### GET /wishes/1
returns the wish with id of 1

### Response
```javascript
{
  "id": 1,
  "user_id": 3,
  "threshold_price": "1500.0",
  "category": "Box-Set",
  "query": "Overwatch Collector",
  "name": "Overwatch-Collectors-PC",
  "saved": true,
  "created_at": "2015-11-12T21:30:31.809Z",
  "updated_at": "2015-11-14T20:36:22.829Z",
  "products": [
    {
      "type": "AmazonProduct",
      "sku": "B017L187X2",
      "image_large": "http://ecx.images-amazon.com/images/I/41HMawomWEL.jpg",
      "image_thumbnail": "http://ecx.images-amazon.com/images/I/41HMawomWEL._SL110_.jpg",
      "title": "Overwatch - Collector's Edition - PC",
      "brand": "Activision",
      "description": "Collector's\nExperience the extraordinary\nPlay as heroes, not classes\nFight for the future.together\nThe world is your battlefield",
      "affiliate_url": "http://www.amazon.com/Overwatch-Collectors-PC/dp/B017L187X2%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB017L187X2"
    }
  ]
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

### PATCH /wishes/3
updates wish with id of 3

### Response
if id is not of user_id that matches
```javascript
{
  "error": "User does not own this wish",
  "user_on_wish": 1,
  "provided": "3"
}
```

### Response
if user_id is correct
```javascript

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
### GET /users/1
returns User with id of One

### Response
```javascript
{
  "id": 1,
  "name": "David Bernheisel",
  "email": "david@wishcastr.com",
  "postal_code": null,
  "amz_id": "AECXWYJZ5BRUS5KCN35V4O4XPP3Q",
  "amz_access_token": "something",
  "amz_raccess_token": null,
  "created_at": "2015-11-12T21:30:29.981Z",
  "updated_at": "2015-11-13T21:07:38.422Z"
}
```

### PATCH /user/3
updates user with id of 3

### Response
```javascript
{
  "id": 3,
  "name": "Jack Handy",
  "email": "jhandy@quotes.com",
  "postal_code": "72727",
  "amz_id": "12334",
  "amz_access_token": "qwer",
  "amz_raccess_token": "12qw",
  "created_at": "2015-11-12T21:30:31.267Z",
  "updated_at": "2015-11-16T16:04:59.999Z"
}
```
