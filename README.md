# Productify

A application to manage company products. This application is used by the frontend company facing client. This client helps our companies manage their products


## Getting started
In order to setup and run the application all you need to do is make sure that you have `docker` and `docker-compose` installed and then run the following command:

```bash
make setup
```

## Current endpoints
```ruby
# Companies
GET /api/v1/companies
GET /api/v1/companies/:id
POST /api/v1/companies
PUT /api/v1/companies/:id
DELETE /api/v1/companies

# Products
GET /api/v1/products
GET /api/v1/products/:id
POST /api/v1/products
PUT /api/v1/products/:id
DELETE /api/v1/products
```

## Tests
To run the tests all you need to do is run:
```bash
make tests
```

