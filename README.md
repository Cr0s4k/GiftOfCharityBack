[![Build Status](https://travis-ci.com/Cr0s4k/GiftOfCharityBack.svg?branch=master)](https://travis-ci.com/Cr0s4k/GiftOfCharityBack)
# README
## General Information
- Ruby version: > ruby 2.3.3
- System dependencies: -
- Database:
    - Sqlite3 in development
    - Pg in production
    
## Database initialization:
    rails db:seed

# Heroku Deployment
    git push heroku anyBranch:master
    heroku run rake db:migrate
    heroku run rake db:seed

## Environtment Variables
    DB_CONNECTION: Heroku Portgress URL 
    PAYPAL_CLIENT_ID: Paypal ID
    PAYPAL_CLIENT_SECRET: Paypal Secret code
    FRONTEND_URL: E.g.: http://localhost:1232
    BITLY_USER: Bitly username
    BITLY_KEY: Bitly key
    BACKEND_HEROKU_APP: E.g.: tfgbackend0
    SENDGRID_USERNAME: Sendgrid username
    SENDGRID_PASSWORD: Sendgrid password
    MAILTRAP_USERNAME: Mailtrap username
    MAILTRAP_PASSWORD: Mailtrap password
    
## Binaries
    wkhtmltopdf 0.12.5