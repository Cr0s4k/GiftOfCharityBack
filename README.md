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