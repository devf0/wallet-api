# Wallet APIs
## How to build
- $ docker compose build
- $ docker compose run --rm api rails db:create
- $ docker compose run --rm api rails db:migrate
- $ docker compose run --rm api rails db:seed
- $ docker compose up -d

## `POST /api/v1/login`
### Request
```javascript
{
  "username": "user1",
  "password": "password1"
}
```
### Response
```javascript
{
  message: "Login successful",
  token: jwt_token
}
```
## `DELETE /api/v1/logout`
### Request
Header: Authentication - Bearer token
### Response
```javascript
{
  message: "Logout successful"
}
```
## `POST /api/v1/transfer`
### Request (sample)
```javascript
{
  "source_type": "User",
  "source_id": 1,
  "target_type": "Stock",
  "target_id": 2,
  "amount": 100
}
```
### Response
```javascript
{
  message: "Transaction successful"
}
```
## `POST /api/v1/deposit`
### Request
```javascript
{
  "source_type": "User",
  "source_id": 1,
  "amount": 100
}
```
### Response
```javascript
{
  message: "Transaction successful"
}
```
## `POST /api/v1/withdraw`
### Request
```javascript
{
  "source_type": "User",
  "source_id": 1,
  "amount": 100
}
```
### Response
```javascript
{
  message: "Transaction successful"
}
```
## `GET /api/v1/stocks/price`
### Request
| Parameter | Type | Description |
| :--- | :--- | :--- |
| `symbol` | `string` | **Required**. e.g. 'NIFTY 50' |
## `GET /api/v1/stocks/prices`
### Request
| Parameter | Type | Description |
| :--- | :--- | :--- |
| `symbol` | `string` | **Required**. e.g. 'NIFTY 50' |
## `GET /api/v1/stocks/all`
